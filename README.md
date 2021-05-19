# ConformityAccountMapping
Generates a csv mapping the AWS or Azure account to the Conformity account ids

## Requires
jq - https://stedolan.github.io/jq/

## Usage
This script calls the Trend Micro Cloud One Conformity API: https://github.com/cloudconformity/documentation-api 

Install jq on your linux/mac https://stedolan.github.io/jq/ <br />
Run the script from the terminal. You can enter Conformity account ids as comma separated arguments. <br />
If left blank, the script will pull results for all your accounts. E.g.

`$ ./accountIds_cc.sh` <br />
`$ ./accountIds_cc.sh acbds2347,sdlccn287`
  
You will be prompted to enter the AWS region your Conformity instance is hosted in, eg:
us-west-2

You will also be prompted to enter the API key for your Conformity user. <br />
Refer to https://www.cloudconformity.com/help/public-api/api-keys.html

The output is a csv file.

### Support
This script is not formally supported by Trend Micro
