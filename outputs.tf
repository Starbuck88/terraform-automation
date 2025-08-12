# Outputs from created resources___
output "ssm_parameter_version" {
  description = "The version of the SSM parameter"
  value       = aws_ssm_parameter.feature_flag.version
}
