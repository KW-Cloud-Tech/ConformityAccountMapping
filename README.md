# ConformityAccountMapping
Generates a csv mapping the AWS account

## Usage
This script calls the Trend Micro Cloud One Conformity API: https://github.com/cloudconformity/documentation-api 

Install jq on your linux/mac https://stedolan.github.io/jq/ \n
Run the script from the terminal. You can enter Conformity account ids as comma separated arguments. \n
If left blank, the script will pull results for all your accounts. E.g.

`$ ./CostRuleData` \n
`$ ./CostRuleData acbds2347,sdlccn287`
  
You will be prompted to enter the AWS region your Conformity instance is hosted in, eg:
us-west-2

You will also be prompted to enter the API key for your Conformity user. \n
Refer to https://www.cloudconformity.com/help/public-api/api-keys.html

The output is a csv file.
