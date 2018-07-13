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
curl -o ~/.git-templates/hooks/pre-commit https://gist.githubusercontent.com/PauloSalum/47330177a5480aafd8bd76109d656fc4/raw/a25f420769a108b129e98ec4e00ed0708d8c7612/pre-commit.sh
chmod a+x ~/.git-templates/hooks/pre-commit
echo -e "${HIGHLIGHT}Scanning ${HOME}${NORMAL}"
scan ${HOME}
