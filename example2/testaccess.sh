#!/bin/bash
# test the access token. Pass it on the command line argument to this script

echo "First checking the access token against OpenAM directly"
curl http://openam.example.com:28080/openam/oauth2/tokeninfo?access_token=$1


echo "Now trying the gateway"

curl -H "Authorization: Bearer $1"   http://localhost:9080/short?url=http://foo.com
