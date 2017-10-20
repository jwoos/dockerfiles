import json

import boto3


sqs = boto3.resource(
    'sqs',
    endpoint_url='http://localhost:9324',
    region_name='elasticmq',
    aws_secret_access_key='x',
    aws_access_key_id='x',
    use_ssl=False
)

client = sqs.meta.client
