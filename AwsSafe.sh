#!/bin/bash
HIGHLIGHT="\e[01;34m"
NORMAL='\e[00m'

function update() {
	local d="$1"
	if [ -d "$d" ]; then
		cd $d >/dev/null
		if [ -d ".git" ]; then
			git init
		else
			scan *
		fi
		cd .. >/dev/null
	fi
}

function scan() {
	for x in $*; do
		update "$x"
	done
}

git config --global init.templatedir '~/.git-templates'
mkdir -p ~/.git-templates/hooks
curl -o ~/.git-templates/hooks/pre-commit https://gist.githubusercontent.com/PauloSalum/913e513a7c16e5b673bc5beae4e95fff/raw/7ed2a4db70cf0d9b114feeaa0139900a0592489a/pre-commit
chmod a+x ~/.git-templates/hooks/pre-commit
echo -e "${HIGHLIGHT}Scanning ${HOME}${NORMAL}"
scan ${HOME}
