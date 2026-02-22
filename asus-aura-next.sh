#!/bin/bash

auras=("static -c 000000" "static -c ADD8E6" "rainbow-cycle -s low")
n_auras=${#auras[@]}
aura_state_file="$HOME/.config/aura-i3"
current=$(cat $aura_state_file  2> /dev/null || echo ${auras[0]})

current_index=0
for i in "${!auras[@]}"; do
	if [[ "${auras[$i]}" = "${current}" ]]; then
		current_index=$i
	fi
done

next_index=$(((current_index+1)%n_auras))
next="${auras[$next_index]}"
echo "/usr/bin/asusctl aura $next"
eval "/usr/bin/asusctl aura $next"
echo $next > $aura_state_file
