curl -O http://api.lobbyfacts.eu/api/1/meeting_deregistered.csv 
curl -O http://api.lobbyfacts.eu/api/1/meeting_participants.csv 
curl -O http://api.lobbyfacts.eu/static/meeting.csv
#curl -O http://api.lobbyfacts.eu/api/1/meeting.csv 
curl -O http://api.lobbyfacts.eu/api/1/financial_data.csv
curl -O http://parltrack.euwiki.org/dumps/attendance.csv
curl http://api.lobbyfacts.eu/api/1/country.csv > country-data.csv
python fetch_representative.py
