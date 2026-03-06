group "all" {
  targets = ["web","misc"]
}

group "misc" {
  targets = ["RT7"]
}

group "pentest" {
  targets = ["tempo"]
}

group "web" {
  targets = ["annee-60", "back-up", "memoire_liquide", "STF","Couloirs-du-temps","Grave_QL"]
}

# Web

target "annee-60" {
  context = "./Web/annee_60/"
  dockerfile = "Dockerfile"
  tags = ["annee-60:latest"]
}

target "back-up" {
  context = "./Web/back-up/"
  dockerfile = "Dockerfile"
  tags = ["back-up:latest"]
}

target "memoire_liquide" {
  context = "./Web/memoire_liquide/"
  dockerfile = "Dockerfile"
  tags = ["memoire_liquide:latest"]
}

target "STF" {
  context = "./Web/STF/"
  dockerfile = "Dockerfile"
  tags = ["stf:latest"]
}

target "Couloirs-du-temps" {
  context = "./Web/Couloirs-du-temps/chall/src/monodocker/"
  dockerfile = "Dockerfile"
  tags = ["couloirs-du-temps:latest"]
}

target "Grave_QL" {
  context = "./Web/Grave_QL/"
  dockerfile = "Dockerfile"
  tags = ["grave-ql:latest"]
}

# Misc

target "RT7" {
  context = "./Misc/RT7/"
  dockerfile = "Dockerfile"
  tags = ["rt7:latest"]
}

# Pentest

target "tempo" {
  context = "./Pentest/Tempo/"
  dockerfile = "Dockerfile"
  tags = ["tempo:latest"]
}
