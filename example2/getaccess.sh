#!/bin/bash
# Call OpenAM to get an access token

curl --request POST \
 --user "client:password" \
 --data "grant_type=password&username=demo&password=password&scope=cn%20mail%20profile" \
 http://openam.example.com:28080/openam/oauth2/access_token

