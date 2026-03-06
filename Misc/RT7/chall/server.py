#!/usr/bin/env python3
import os
import socket
import subprocess
import sys

HOST = "0.0.0.0"
PORT = 5555


# ROT47
def rot47(s):
    out = ""
    for c in s:
        o = ord(c)
        if 33 <= o <= 126:
            out += chr(33 + ((o + 14) % 94))
        else:
            out += c
    return out


# Supprime 1 caractère sur 2
def remove_every_second(s):
    return s[0::2]


# Nettoyage simple
def remove_non_ascii(s):
    return "".join(c for c in s if 32 <= ord(c) <= 126)


def handle_client(conn):

    # Définition du prompt
    username = "ctfplayer"
    hostname = "RT7"
    cwd = "~"

    while True:
        # Prompt
        prompt = f"{username}@{hostname}:{cwd}$ "
        conn.send(prompt.encode())

        # Lire entrée utilisateur
        data = conn.recv(1024)
        if not data:
            break

        user_raw = data.decode(errors="ignore").strip()

        # Décodage ROT47 puis suppression 1/2 char
        decoded = rot47(user_raw)
        cmd = remove_every_second(decoded)
        cmd = remove_non_ascii(cmd)

        if cmd == "":
            continue

        # Exécution commande
        proc = subprocess.Popen(
            cmd,
            shell=True,
            executable="/bin/rbash",
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            text=True
        )

        # Envoi sortie brute avec nettoyage
        for line in proc.stdout:
            if line.startswith("/bin/sh: 1: "):
                line = line.replace("/bin/sh: 1: ", "")
            conn.send(line.encode())

        conn.send(b"\n")
        proc.wait()


def main():
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.bind((HOST, PORT))
    s.listen(5)

    print(f"[RT7] Serveur en écoute sur le port {PORT}")

    while True:
        conn, addr = s.accept()
        print(f"[RT7] Connexion : {addr}")
        try:
            handle_client(conn)
        except Exception as e:
            print("[RT7] ERREUR :", e)
        finally:
            conn.close()
            print("[RT7] Déconnexion")


if __name__ == "__main__":
    main()
