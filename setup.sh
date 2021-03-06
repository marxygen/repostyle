#! /bin/sh
cat  << Intro
==================== Environment configuration utility ====================
1. Installs pre-commit
2. Downloads .pre-commit-config.yaml
3. Configures pre-commit
4. Validates all files in current repo
5. Wishes you good luck
Intro
echo ""

set -e

GIT_FOLDER=$(ls -a | grep .git$)

if ! [ "$GIT_FOLDER" ]
then
    echo -e "\e[1;31m You have to be located in your project's root directory (where .git is) \e[0m"
    exit 1
fi

echo "Installing pre-commit..."
pip install pre-commit --quiet

COMMAND="curl.exe"
if [[ "$uname" == 'Linux' ]]; 
then
    COMMAND="wget"
    echo "Switching to wget to download files"
fi
   
echo "Downloading pre-commit configuration..."
$COMMAND -s -o .pre-commit-config.yaml https://raw.githubusercontent.com/marxygen/repostyle/main/hooks/.pre-commit-config.yaml

echo "Configuring pre-commit..."
pre-commit install

NEW_HOOK=$(cat .git/hooks/pre-commit | grep "File generated by pre-commit")
if ! [ "$NEW_HOOK" ]
then
    echo -e "\e[1;31m Something went wrong: new pre-commit is not in .git/hooks! \e[0m"
    exit 1
fi

echo "Validating existing files..."
pre-commit run --all-files

echo "Good luck using your new environment!"
