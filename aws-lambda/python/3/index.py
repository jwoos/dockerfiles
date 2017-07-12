import os
import sys


def lambda_handler(event, context):
    print('event:', event)
    print('context:', context)

    return 'It works!'
