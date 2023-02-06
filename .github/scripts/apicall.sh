#HTTP_CODE=$(curl --write-out "%{http_code}\n" "https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22" --output output1.txt --silent)
#echo $HTTP_CODE
#echo output1.txt


request_payload={\"body\":\"$(cat error.log)\"}

curl --silent \
    --request POST \
    --data $request_payload \
    --header  'accept: application/json' \
    --header  'Authorization: 2f28cdbb-c5df-4146-a8c4-05046a380d00' \
    --header  'Content-Type: application/json' \
    https://api.swaggerhub.com/apis/RAJESHP1231234_1/Rajesh/1.0.0/comments
