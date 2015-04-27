import json
import urllib

limit=100
offset=0
# Set the request URL
url = 'http://api.lobbyfacts.eu/api/1/meeting?limit='+`limit`+'&offset='+`offset`
u = urllib.urlopen(url)
result = json.load(u) 
total = result["count"]
meeting = result["results"]

while result["next"]:
    offset = offset + limit
    url = 'http://api.lobbyfacts.eu/api/1/meeting?limit='+`limit`+'&offset='+`offset`
    print "fetching " + url
    u = urllib.urlopen(url)
    u = urllib.urlopen(url)
    result = json.load(u)
    meeting = meeting + result["results"]

with open('meeting.json', 'w') as fp:
    json.dump(meeting, fp)
