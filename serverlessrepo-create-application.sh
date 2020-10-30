#!/bin/bash

s3bucket=

aws cloudformation package --template-file template.yaml --s3-bucket ${s3bucket} > template.tmp
declare -a StringArray=("us-east-1" "us-east-2" "us-west-1" "us-west-2" "ap-east-1" "ap-east-1" "ap-south-1" "ap-northeast-2" "ap-southeast-1" "ap-southeast-2" "ap-northeast-1" "ca-central-1" "eu-central-1" "eu-west-1" "eu-west-2" "eu-west-3" "eu-north-1" "me-south-1" "sa-east-1")
 
# Iterate the string array using for loop
for region in ${StringArray[@]}; do

   aws serverlessrepo create-application \
     --author "FormKiQ Inc" \
     --description "AWS Lambda Layer that includes the Git binary" \
     --home-page-url https://github.com/formkiq/lambda-layer-git \
     --name Git-Layer \
     --labels "lambda" "layer" "git" \
     --region "$region" \
     --license-body file://LICENSE \
     --readme-body file://README.md \
     --semantic-version "2.28.0" \
     --template-body file://template.tmp
done
