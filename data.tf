data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "this_kms" {
  dynamic "statement" {
    for_each = local.kms_allowed_accounts
    content {
      sid    = "Enable IAM Permissions from ${statement.value}"
      effect = "Allow"
      principals {
        identifiers = ["arn:aws:iam::${statement.value}:root"]
        type        = "AWS"
      }
      actions   = ["kms:*"]
      resources = ["*"]
    }
  }
}

data "aws_iam_policy_document" "this_s3" {
  statement {
    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }
    effect    = "Allow"
    resources = ["${aws_s3_bucket.this.arn}"]
    actions = [
      "s3:GetBucketAcl"
    ]
  }

  statement {
    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }
    effect    = "Allow"
    resources = ["${aws_s3_bucket.this.arn}/prefix/AWSLogs/${data.aws_caller_identity.current.account_id}/*"]
    actions = [
      "s3:PutObject"
    ]
    condition {
      test     = "ForAnyValue:StringEquals"
      variable = "s3:x-amz-acl"
      values   = ["bucket-owner-full-control"]
    }
  }
}