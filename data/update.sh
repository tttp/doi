#http://harelba.github.io/q/install.html

#country
echo 'id,name' > country.csv
jq -M ".[]|[.id,.name]|@csv" ../country.json >> country.csv

#representative
#echo 'id,contact_country,acronym,name,main_category,sub_category' >  representative.csv
#jq -r ".[]|[.id,.contact_country,.acronym,.name,.main_category,.sub_category]|@csv" representative.json >> representative.csv

#debug version
echo 'id,contact_country,sub_category,sub_category_title,acronym,name,main_category,main_category_title,code,fte' >  representative.csv
jq -r '.[]|select(.status=="active")|[.id,.contact_country,.sub_category,.sub_category_title,.acronym,.name,.main_category,.main_category_title,.identification_code,.members_fte]|@csv' representative.json >> representative.csv

#meeting
sed -i 's/T00:00:00//g' meeting-flat.json 
echo 'id,host,date,title,guest,unregistered,guestid,cabinet,nb' > meeting.csv 
#jq -r ".[]|select(.cancelled=false)|[.id,.ec_representative,.date,.subject,.participants[0][1],.participants[0][0],.ec_org]|@csv" meeting-flat.json  >> meeting.csv
#jq -r ".[]|select(.cancelled=false)|[.id,.ec_representative,.date,.subject,.participants[0][1],.unregistered,.participants[0][0],.ec_org]|@csv" meeting-flat.json  >> meeting.csv
#jq -r '.[]|select(.cancelled=false)|select(.status=="active")|[.id,.ec_representative,.date,.subject,.participant,.unregistered,.participant_id,.ec_org]|@csv' meeting-flat.json  >> meeting.csv
jq -r '.[]|[.id,.ec_representative,.date,.subject,.participant,.unregistered,.participant_id,.ec_org,.nb]|@csv' meeting-flat.json  >> meeting.csv
#jq -r ".[]|select(.cancelled=false)|{id,ec_representative,date,subject,ec_org, guest: .participants[0][0],idguest:.participants[0][1]}" meeting.json > meeting-light.json

#nice -n19 jq 'map( del(.contact_more) | del(.networking)| del(.goals) | del (.activities) | del(.uri) | del(.code_of_conduct)| del(.contact_fax) | del(.status) | del(.head) | del(.head) | del (.contact_street) | del(.entity) | del(.info_members) | del(.contact_phone) | del(.created_at) | del(.legal) | del(.contact_post_code) )' representative.json > representative-light.json

#curl -O http://api.lobbyfacts.eu/api/1/financial_data.csv > financial_data.csv

csvjoin   --left -c id,representative representative.csv financial_data.csv  > representative-financial.csv
csvcut representative-financial.csv -c id,contact_country,sub_category,acronym,name,main_category,cost_min,cost_max,cost_absolute,fte,code > representative-finance-light.csv

#curl -O http://api.lobbyfacts.eu/api/1/accreditation.csv > accreditation.csv
echo 'id,accredited' > representative_count.csv
#q "select representative_id,count(*) FROM accreditation.csv where status='active' group by representative_id"  -d, -H >> representative_count.csv;

csvjoin --left -c id,id  representative-finance-light.csv representative_count.csv  > r.csv


