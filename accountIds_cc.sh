#!/bin/bash
# Map AWS account numbers and Azure subscriptions-ids to Conformity Account ids

echo "Which region is your conformity environment hosted in?"
read -r region

echo "Enter your api key: "
read -r apikey

# select which Conformity accounts to run against using arguments
if [ "$#" -eq  "0" ]
then
    printf "\nNo accountid arguments specified, generating report across all accounts loaded in conformity\n"
    export accountid=(`curl -L -X GET \
        "https://$region-api.cloudconformity.com/v1/accounts" \
        -H "Content-Type: application/vnd.api+json" \
        -H "Authorization: ApiKey $apikey" \
        | jq -r '.data | map(.id) | join(",")'`)
	echo "\nWill generate report for the following accounts $accountid"
else #run against only specified accountids in argument
    export accountid=$1
	printf "\nGenerating cost report for account(s) $1\n"
fi

# print a list of accounts and their AWS account numbers
TIMESTAMP=`date +%Y%m%d-%H%M%S`
curl -L -X GET \
        "https://$region-api.cloudconformity.com/v1/accounts" \
        -H "Content-Type: application/vnd.api+json" \
        -H "Authorization: ApiKey $apikey" \
	| jq -r '.data[] | {"CloudType": .attributes | .["cloud-type"], "Account-Name" : .attributes | .["name"], "Conformity-ID" : .id, "AWSAccount" : .attributes | .["awsaccount-id"], "AzureSubscription": .attributes | .["cloud-data"] | .azure.subscriptionId } | keys_unsorted, map(.) | @csv' | awk 'NR==1 || NR%2==0'  >> AWS_CC_mapping_$TIMESTAMP.csv
printf "\n'AWS_CC_mapping$TIMESTAMP.csv' created\n"
