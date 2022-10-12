#!/bin/bash
aws lambda invoke --function-name 07_AWS_Lambda --cli-binary-format raw-in-base64-out --payload '{"What is your name?": "Jim","How old are you?": 33}' out
sed -i'' -e 's/"//g' out
sleep 15
aws logs get-log-events --log-group-name /aws/lambda/07_AWS_Lambda --log-stream-name $(cat out) --limit 5