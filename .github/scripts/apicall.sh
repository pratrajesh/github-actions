# Building request body and saving it to json file
#echo "{\"body\":\"$(cat error.log)\",\"position\":0}" > body.json

while read line; do
  if [ "$line" = '^\s*([0-9]*):([0-9]*)\s*error\s*.*$' ] 
   then echo "$line"
   fi
done <error.log

lintStatus=$1

echo "lint step status :: $lintStatus"

date=`date +"%m/%d/%Y %H:%M:%S"`

echo "date :: $date"

if [ "$lintStatus" = "failure" ]
then
echo "{\"body\":\"$(cat error.log)\",\"position\":0}" > body.json
else
   if [ "$lintStatus" = "success" ]
   then
      echo "{\"body\":\"success\",\"position\":0}" > body.json
   fi
fi

cat body.json

curl --location --request POST 'https://api.swaggerhub.com/apis/RAJESHP1231234_1/Rajesh/1.0.0/comments' \
-H 'accept: application/json' \
-H 'Authorization: 2f28cdbb-c5df-4146-a8c4-05046a380d00' \
-H 'Content-Type: application/json; charset=utf-8' \
-d @body.json
