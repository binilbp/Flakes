#!/run/current-system/sw/bin/env bash

#shells location
shellsDir=~/Projects/Flakes/*/
shellsPaths=()

number=1
#display the shells
for dir in $shellsDir; do
	shellsPaths+=("$dir")
	printf '%d -> \e[1;33m%s\e[0m\n' "$number" "$(basename "$dir")"
	((number++))
done

read -p "enter devShell option: " choice

#validating the choice
if [[ "$choice" -lt 1 || "$choice" -gt "${#shellsPaths[@]}" ]]; then
    echo "Invalid choice."
    exit 1
fi

shellPath="${shellsPaths[$((choice - 1))]}"

nix develop $shellPath --command zsh -i
