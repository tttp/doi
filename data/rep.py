import json
import copy
from collections import defaultdict


def get_reps(ps,type):
    participants=[]
    for token in ps.split('), '):
        idx=token.find('(')
        idx2=token.find(')')
        if (idx2 == -1):
            idx2=10000 # take all the id
#        if 30<idx<=32:
#            try: int(token[:idx],16)
#            except:
#              print token
#              continue
        participants.append([token[:idx],token[idx+1:idx2],type])
    return participants


json_data=open('meeting.json').read()
meetings = []
count=0
inactive=0
cancelled=0
#counter = defaultdict(int)
for data in json.loads(json_data):
  if data["cancelled"]==True:
    cancelled +=1
    continue
  if data["status"]=="inactive":
    inactive +=1
    continue
  count +=1
  nbparticipants = 0 
  if len(data["participants"]) > 0:
    ps = get_reps(data["participants"],"registered")
    nbparticipants += 1+data["participants"].count(',')
  if len(data["deregistered"]) > 0:
    ps = get_reps(data["deregistered"],"deregistered")
    nbparticipants += 1+data["deregistered"].count(',')
  if hasattr(data, 'unregistered') and len(data["unregistered"]):
    nbparticipants +=1
    ps = ["",data["unregistered"],"unregistered"]
    del meeting["unregistered"]
  for participant in (ps):
#      meeting =  copy.deepcopy(data)
    meeting =  copy.copy(data)
    meeting["nb"]= nbparticipants
    meeting["participant_id"]= participant[1]
    meeting["participant"]= participant[0]
    meeting["status"]= participant[2]
    del meeting["cancelled"]
    del meeting["participants"]
    del meeting["deregistered"]
    del meeting["unregistered"]
    meetings.append (meeting)
#      counter[meeting["id"]] +=1
    #del meeting["participants"]

    #raise SystemExit

print "active:" + `count`
print "inactive:"+`inactive`
print "cancelled:"+`cancelled`
print len(meetings)
with open('meeting-flat.json', 'w') as fp:
    json.dump(meetings, fp)
