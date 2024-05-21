resource "aws_api_gateway_model" "audio_mpeg_model" {
  rest_api_id  = aws_api_gateway_rest_api.aws_gateway_rest_api.id
  name         = "AudioMPEG"
  description  = "API model for sound reponse"
  content_type = "audio/mpeg"
  schema = jsonencode({
    type = "object"
  })
}

resource "aws_api_gateway_model" "text_model" {
  rest_api_id  = aws_api_gateway_rest_api.aws_gateway_rest_api.id
  name         = "Text"
  description  = "API model for text request"
  content_type = "application/json"
  schema = jsonencode({
    "$schema" : "http://json-schema.org/draft-04/schema#",
    "title" : "TextToSpeechModel",
    "type" : "object",
    "required" : ["text"],
    "properties" : {
      "text" : {
        "type" : "string"
      }
    }
  })
}
