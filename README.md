# ENI-CTF-2026-Challs
Liste des challs ENI CTF 2026

## Templates
Les Templates pour les chall maker se trouve dans `./templates/`

## Build

build tout les challs

```bash
docker buildx bake -f docker-build.hcl all --no-cache
```

build que certaines catégories : [ mics, pentest, web ]
```bash
docker buildx bake -f docker-build.hcl <categorie> --no-cache
```
