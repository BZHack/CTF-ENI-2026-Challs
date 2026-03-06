# Challenge
La capsule de 1995
## Enonce
Des archéologues du futur découvrent une capsule temporelle verrouillée par un mot de passe, nous avons réussi à extraire le hash de ce dernier.
Son contenu serait un avertissement capital pour notre époque.
Saurez-vous retrouver le mot permettant d’ouvrir la capsule ?

914daf73d1d8844afdc25d708da670355ea44b37
## Solution
echo '914daf73d1d8844afdc25d708da670355ea44b37' > hash
hashcat -m 100 hash /usr/share/wordlist/rockyou.txt
ENI{thefutureisnow}
## Hints
https://www.tunnelsup.com/hash-analyzer/
https://hashcat.net/wiki/doku.php?id=example_hashes
