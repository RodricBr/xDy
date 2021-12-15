#!/usr/bin/bash

# Cores
VERDE='\033[32m'
ROXO='\033[38;5;57m'
FIM='\033[0m'

# Banner
echo -e ${VERDE}'        ______
 _   _ (____  \  _   _
( \ / )| |   | || | | |
 ) X ( | |__/ / | |_| |
(_/ \_)|_____/   \__  |
                (____/'${FIM}

# Número da contagem de rodadas do dado
echo ""
read -rp "$(echo -e $VERDE"Dados: "$FIM)" DADO
read -rp "$(echo -e $VERDE"Alcance: "$FIM)" ALCANCE
#FIM=5

# Se o output do dado e do alcance forem alfabéticos (não forem números)...
if [[ "$DADO" =~ ^[[:alpha:]]$ && "$ALCANCE" =~ ^[[:alpha:]]$ ]]; then
  echo -e "Apenas números são válidos!"
  exit 1
else
  :
fi

# Contagem
INDEX=0
for ((i = 1; i <= DADO; i++)); do
  let "INDEX+=1"; printf "${ROXO}[$INDEX]${FIM} Número: %s\n" $(echo $((RANDOM % "$ALCANCE + 1")))
done
