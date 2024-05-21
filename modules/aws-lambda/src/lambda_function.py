import json
import boto3
import base64

s3 = boto3.client("s3")

def lambda_handler(event, context):
 
    polly_client = boto3.client("polly")
    
    s3_client = boto3.client('s3')
    
    try:
        
        response = polly_client.synthesize_speech (
            LanguageCode="pl-PL",
            VoiceId='Maja',
            Engine="standard",
            OutputFormat='mp3',
            Text= event['text'],
            )
            
        return base64.b64encode(response['AudioStream'].read())
        
    except Exception as error:
        return {
            'error':str(error)
        }
      
    
