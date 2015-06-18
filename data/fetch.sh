curl -O http://api.lobbyfacts.eu/api/1/meeting_deregistered.csv 
curl -O http://api.lobbyfacts.eu/api/1/meeting_participants.csv 
curl -O http://api.lobbyfacts.eu/api/1/meeting.csv 
curl http://api.lobbyfacts.eu/api/1/financial_data.csv  > representative-financial.csv
curl http://api.lobbyfacts.eu/api/1/country.csv > country-data.csv

