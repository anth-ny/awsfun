curl -s https://raw.githubusercontent.com/boto/botocore/develop/botocore/data/ec2/2016-11-15/service-2.json | jq '.shapes.InstanceType.enum | sort' | tee boto_instance_types.json
aws ec2 describe-spot-price-history --start-time 2019-01-01T00:00:00Z | jq '[.SpotPriceHistory[].InstanceType] | unique' | tee spot_instance_types.json
curl -s https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonEC2/current/index.json | jq '[.products[] | select(.productFamily=="Compute Instance").attributes.instanceType] | unique' | tee ondemand_instance_types.json
