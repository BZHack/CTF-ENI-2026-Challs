import os
import sqlite3
import re
from flask import Flask, session, redirect, url_for, request, render_template, g

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
TEMPLATES_DIR = os.path.join(BASE_DIR, 'templates')
DB_PATH = os.path.join(BASE_DIR, 'users.db')

app = Flask(__name__, template_folder=TEMPLATES_DIR)
app.secret_key = 'mahalnamahalkita'

FLAG = 'ENI{flAsQuE_c0Okie_cHal1enGe}'

# -------------------------------------------------------
# Gestion SQLite
# -------------------------------------------------------

def get_db():
    if 'db' not in g:
        g.db = sqlite3.connect(DB_PATH)
        g.db.row_factory = sqlite3.Row
    return g.db

@app.teardown_appcontext
def close_db(e=None):
    db = g.pop('db', None)
    if db is not None:
        db.close()

def init_db():
    os.makedirs(os.path.dirname(DB_PATH) or '.', exist_ok=True)
    db = sqlite3.connect(DB_PATH)
    db.execute('CREATE TABLE IF NOT EXISTS users (username TEXT PRIMARY KEY, password TEXT)')
    db.commit()
    db.close()

# -------------------------------------------------------
# Routes Flask
# -------------------------------------------------------

@app.route('/')
def index():
    return render_template('index.html', title='Accueil')

@app.route('/register', methods=['GET', 'POST'])
def register():
    if 'username' in session:
        return redirect(url_for('index'))

    error = None

    if request.method == 'POST':
        user = request.form.get('username', '').strip()
        pw = request.form.get('password', '').strip()

        if not user or not pw:
            error = "Tous les champs sont requis."
        elif not re.match(r'^[a-zA-Z0-9]+$', user):
            error = "Le nom d'utilisateur ne peut contenir que des caractères alphanumériques."
        elif user.lower() == 'admin':
            error = "La création du compte 'admin' est interdite."
        else:
            db = get_db()
            try:
                db.execute('INSERT INTO users (username, password) VALUES (?, ?)', (user, pw))
                db.commit()
                return redirect(url_for('login'))
            except sqlite3.IntegrityError:
                error = "Cet utilisateur existe déjà."

    return render_template('register.html', title='Register', error=error)

@app.route('/login', methods=['GET', 'POST'])
def login():
    if 'username' in session:
        return redirect(url_for('index'))

    error = None

    if request.method == 'POST':
        user = request.form.get('username', '').strip()
        pw = request.form.get('password', '').strip()

        db = get_db()
        cur = db.execute('SELECT password FROM users WHERE username=?', (user,))
        row = cur.fetchone()

        if row and row['password'] == pw:
            session.clear()
            session['username'] = user
            session['is_admin'] = False
            return redirect(url_for('index'))
        else:
            error = "Identifiants invalides"

    return render_template('login.html', title='Login', error=error)

@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('index'))

@app.route('/profile')
def profile():
    if 'username' not in session:
        return redirect(url_for('login'))
    return render_template('profile.html', title='Profile')

@app.route('/admin')
def admin():
    if session.get('is_admin'):
        return render_template('admin.html', title='Admin', flag=FLAG)
    return render_template('admin.html', title='Admin', flag=None), 403

# -------------------------------------------------------
# Initialisation
# -------------------------------------------------------

if __name__ == '__main__':
    with app.app_context():
        init_db()
    app.run(host='0.0.0.0', port=5000, debug=True)
