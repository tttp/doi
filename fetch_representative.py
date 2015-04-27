import json
import urllib

limit=100
offset=0
# Set the request URL
url = 'http://api.lobbyfacts.eu/api/1/representative?limit='+`limit`+'&offset='+`offset`
u = urllib.urlopen(url)
result = json.load(u) 
total = result["count"]
representative = result["results"]

while result["next"]:
    offset = offset + limit
    url = result["next"]
    print "fetching " + url
    u = urllib.urlopen(url)
    result = json.load(u)
    representative = representative + result["results"]

with open('representative.json', 'w') as fp:
    json.dump(representative, fp)
