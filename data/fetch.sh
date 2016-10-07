export PYENV_ROOT="/home/xavier/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

curl http://stage.lobbyfacts.nestor.coop/transparency_csv > transparency.csv
curl -O http://api.lobbyfacts.nestor.coop/api/1/meeting_deregistered.csv 
curl -O http://api.lobbyfacts.nestor.coop/api/1/meeting_participants.csv 
#curl -O http://api.lobbyfacts.eu/static/meeting.csv
#curl -O http://api.lobbyfacts.nestor.coop/api/1/meeting.csv 
#curl -O http://stage.lobbyfacts.nestor.coop/1/financial_data.csv
curl -O https://lobbyfacts.eu/transparency_meetings > meeting.csv
curl -O http://parltrack.euwiki.org/dumps/attendance.csv
#curl http://api.lobbyfacts.nestor.coop/1/country.csv > country-data.csv
#curl http://api.lobbyfacts.eu/api/1/country.csv  > country-data.csv
#python fetch_representative.py

#curl -O http://api.lobbyfacts.eu/api/1/meeting_deregistered.csv 
#curl -O http://api.lobbyfacts.eu/api/1/meeting_participants.csv 
curl -O http://api.lobbyfacts.eu/static/meeting.csv
#curl -O http://api.lobbyfacts.eu/api/1/meeting.csv 

