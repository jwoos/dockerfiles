import json

import boto3


sns = boto3.resource(
    'sns',
    endpoint_url='http://localhost:9292',
    region_name='goaws',
    aws_secret_access_key='x',
    aws_access_key_id='x',
    use_ssl=False
)

client = sns.meta.client
