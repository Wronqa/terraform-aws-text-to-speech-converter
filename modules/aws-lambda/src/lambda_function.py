import json
import boto3
import base64

s3 = boto3.client("s3")



def lambda_handler(event, context):
    # TODO implement
    
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
        
        
    
        #while True:
            #res=polly_client.get_speech_synthesis_task(TaskId=taskId['TaskId'])['SynthesisTask']['TaskStatus']
            
            #if res == 'completed':
                
                #object2 = s3_client.get_object(Bucket="text-transcription-bucket", Key=key)
                #byteBase64 = base64.b64encode(object2['Body'].read())
                
                #return byteBase64

    except Exception as error:
        return {
            'error':str(error)
        }
      
    
