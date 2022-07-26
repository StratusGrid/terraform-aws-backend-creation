locals {
  kms_allowed_accounts = compact([data.aws_caller_identity.current.account_id])
}

resource "aws_kms_key" "this" {
  description         = "Key used to encrypt terraform backend"
  tags                = merge(local.tags, {})
  policy              = data.aws_iam_policy_document.this.json
  enable_key_rotation = true
}

resource "aws_s3_bucket" "this" {
  bucket = "${var.project_name}-terraform-backend"

  logging {
    target_bucket = var.logging_bucket
    target_prefix = "s3/${var.project_name}-terraform-backend/"
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.this.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "default" {
  bucket                  = aws_s3_bucket.this.id
  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}


resource "aws_dynamodb_table" "this" {
  name           = "${var.project_name}-terraform-backend"
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1

  point_in_time_recovery {
    enabled = true
  }

  hash_key = "LockID"

  server_side_encryption {
    enabled     = true
    kms_key_arn = aws_kms_key.this.arn
  }

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = merge(local.tags, {})
}
