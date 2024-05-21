data "external" "validate_input" {
  program = ["powershell.exe", "-File", "./validator/validate_variables.ps1", var.region, var.polly_voice_id, var.polly_language_code]
}

resource "null_resource" "stop_if_invalid" {
  count = data.external.validate_input.result == "0" ? 0 : 1

  provisioner "local-exec" {
    command = "echo Stopping execution due to invalid input; exit 1"
  }
}
