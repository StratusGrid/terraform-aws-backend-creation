output "s3_bucket_id" {
  value       = aws_s3_bucket.this.id
  description = "S3 bucket ID"
}

output "s3_bucket_arn" {
  value       = aws_s3_bucket.this.arn
  description = "S3 bucket ARN"
}

output "dynamodb_table_name" {
  value       = aws_dynamodb_table.this.name
  description = "DynamoDB table name"
}

output "dynamodb_table_arn" {
  value       = aws_dynamodb_table.this.arn
  description = "DynamoDB table arn"
}

output "kms_key_id" {
  value       = aws_kms_key.this.id
  description = "KMS key id"
}

output "kms_key_arn" {
  value       = aws_kms_key.this.arn
  description = "KMS key arn"
}
