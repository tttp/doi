import json

json_data=open('meeting.json').read()
meetings = []
for data in json.loads(json_data):
  if len(data["participants"]) > 0:
    for participant in (data["participants"]):
      meeting = dict(data)
      del meeting["participants"]
      meeting["participant"]= participant[1]
      meeting["participant_id"]= participant[0]
      meetings.append (meeting)

  else:
    meeting["participant"]= ""
    meeting["participant_id"]= ""
    del data["participants"]
    meetings.append (data)

with open('meeting-flat.json', 'w') as fp:
    json.dump(meetings, fp)
