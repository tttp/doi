export PYENV_ROOT="/home/xavier/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

curl -O https://lobbyfacts.eu/transparency_meetings > meeting-test.csv

