import json
import copy
from collections import defaultdict


def get_reps(ps):
    participants=[]
    for token in ps.split(', '):
        idx=token.find('(')
        idx2=token.find(')')
        if 30<idx<=32:
            try: int(token[:idx],16)
            except: continue
            #print 'asdf', idx, token
            participants.append([token[:idx],token[idx+1:idx2]])
    return participants


json_data=open('meeting.json').read()
meetings = []
count=0
#counter = defaultdict(int)
for data in json.loads(json_data):
  if data["status"]=="inactive":
    continue
  count +=1
  if len(data["participants"]) > 0:
    ps = get_reps(data["participants"])

    for participant in (ps):
#      meeting =  copy.deepcopy(data)
      meeting =  copy.copy(data)
      
      meeting["participant_id"]= participant[0]
      meeting["participant"]= participant[1]
      meetings.append (meeting)
#      counter[meeting["id"]] +=1
      del meeting["participants"]

    #raise SystemExit

  else:
    data["participant"]= ""
    data["participant_id"]= ""
    del data["participants"]
    meetings.append (data)

print count
print len(meetings)
with open('meeting-flat.json', 'w') as fp:
    json.dump(meetings, fp)
