param (
    [string]$region,
    [string]$polly_voice_id,
    [string]$language_code
)


if ($region -notin @(
    "us-east-1", "us-east-2", "us-west-1", "us-west-2", "af-south-1",
    "ap-east-1", "ap-south-1", "ap-northeast-1", "ap-northeast-2", "ap-northeast-3",
    "ap-southeast-1", "ap-southeast-2", "ap-southeast-3", "ca-central-1",
    "eu-central-1", "eu-west-1", "eu-west-2", "eu-west-3", "eu-north-1",
    "eu-south-1", "eu-south-2", "me-south-1", "me-central-1", "sa-east-1"
)) {
    Write-Error "Invalid region: $region. Please select a valid AWS region."
    exit 1
}


if ($polly_voice_id -notin @(
    "Aditi", "Amy", "Astrid", "Bianca", "Brian", "Camila", "Carla", "Carmen", 
    "Celine", "Chantal", "Conchita", "Cristiano", "Dora", "Emma", "Enrique", 
    "Ewa", "Filiz", "Geraint", "Giorgio", "Gwyneth", "Hans", "Ines", "Ivy", 
    "Jacek", "Jan", "Joanna", "Joey", "Justin", "Karl", "Kendra", "Kimberly", 
    "Lea", "Liv", "Lotte", "Lucia", "Lupe", "Mads", "Maja", "Marlene", 
    "Mathieu", "Matthew", "Maxim", "Mia", "Miguel", "Mizuki", "Naja", "Nicole", 
    "Olivia", "Penelope", "Raveena", "Ricardo", "Ruben", "Russell", "Salli", 
    "Seoyeon", "Takumi", "Tatyana", "Vicki", "Vitoria", "Zeina", "Zhiyu"
)) {
    Write-Error "Invalid voice id: $polly_voice_id. Please select a valid voice id."
    exit 1
}

if ($language_code -notin @(
    "arb", "cmn-CN", "cy-GB", "da-DK", "de-DE", "en-AU", "en-GB", "en-GB-WLS", 
    "en-IN", "en-NZ", "en-US", "es-ES", "es-MX", "es-US", "fr-CA", "fr-FR", 
    "hi-IN", "is-IS", "it-IT", "ja-JP", "ko-KR", "nb-NO", "nl-NL", "pl-PL", 
    "pt-BR", "pt-PT", "ro-RO", "ru-RU", "sv-SE", "tr-TR"
)) {
    Write-Error "Invalid language code: $language_code. Please select a valid language code."
    exit 1
}


Write-Output '{"valid": "true"}'
exit 0
