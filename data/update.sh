#country
echo 'id,name' > country.csv
jq -M ".[]|[.id,.name]|@csv" ../country.json >> country.csv

#representative
echo 'id,contact_country,sub_category_title' >  representative.csv
jq -r ".[]|[.id,.contact_country,.sub_category_title]|@csv" representative.json >> representative.csv

#meeting
sed -i 's/T00:00:00//g' meeting.json 
echo 'id,host,date,title,guest,unregistered,guestid,cabinet' > meeting.csv 
#jq -r ".[]|select(.cancelled=false)|[.id,.ec_representative,.date,.subject,.participants[0][1],.participants[0][0],.ec_org]|@csv" meeting.json  >> meeting.csv
jq -r ".[]|select(.cancelled=false)|[.id,.ec_representative,.date,.subject,.participants[0][1],.unregistered,.participants[0][0],.ec_org]|@csv" meeting.json  >> meeting.csv
jq -r ".[]|select(.cancelled=false)|{id,ec_representative,date,subject,ec_org, guest: .participants[0][0],idguest:.participants[0][1]}" meeting.json > meeting-light.json

#nice -n19 jq 'map( del(.contact_more) | del(.networking)| del(.goals) | del (.activities) | del(.uri) | del(.code_of_conduct)| del(.contact_fax) | del(.status) | del(.head) | del(.head) | del (.contact_street) | del(.entity) | del(.info_members) | del(.contact_phone) | del(.created_at) | del(.legal) | del(.contact_post_code) )' representative.json > representative-light.json

