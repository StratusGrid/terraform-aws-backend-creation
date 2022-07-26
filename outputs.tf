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