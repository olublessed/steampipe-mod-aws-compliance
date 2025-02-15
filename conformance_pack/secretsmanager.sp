locals {
  conformance_pack_secretsmanager_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/SecretsManager"
  })
}

control "secretsmanager_secret_automatic_rotation_enabled" {
  title       = "Secrets Manager secrets should have automatic rotation enabled"
  description = "This rule ensures AWS Secrets Manager secrets have rotation enabled. Rotating secrets on a regular schedule can shorten the period a secret is active, and potentially reduce the business impact if the secret is compromised."
  query       = query.secretsmanager_secret_automatic_rotation_enabled

  tags = merge(local.conformance_pack_secretsmanager_common_tags, {
    cisa_cyber_essentials = "true"
    gxp_21_cfr_part_11    = "true"
    hipaa                 = "true"
    nist_800_53_rev_5     = "true"
    nist_csf              = "true"
  })
}

control "secretsmanager_secret_rotated_as_scheduled" {
  title       = "Secrets Manager secrets should be rotated as per the rotation schedule"
  description = "This rule ensures that AWS Secrets Manager secrets have rotated successfully according to the rotation schedule. Rotating secrets on a regular schedule can shorten the period that a secret is active, and potentially reduce the business impact if it is compromised."
  query       = query.secretsmanager_secret_rotated_as_scheduled

  tags = merge(local.conformance_pack_secretsmanager_common_tags, {
    gxp_21_cfr_part_11 = "true"
    nist_800_53_rev_4  = "true"
    nist_800_53_rev_5  = "true"
    nist_csf           = "true"
  })
}

control "secretsmanager_secret_unused_90_day" {
  title       = "Secrets Manager secrets should be rotated as per the rotation schedule"
  description = "Ensure if AWS Secrets Manager secrets have been accessed within a specified number of days. The rule is non compliant if a secret has not been accessed in 'unusedForDays' number of days. The default value is 90 days."
  query       = query.secretsmanager_secret_unused_90_day

  tags = merge(local.conformance_pack_secretsmanager_common_tags, {
    cisa_cyber_essentials = "true"
    nist_800_53_rev_5     = "true"
  })
}

control "secretsmanager_secret_encrypted_with_kms_cmk" {
  title       = "Secrets Manager secrets should be encrypted using CMK"
  description = "Ensure if all secrets in AWS Secrets Manager are encrypted using the AWS managed key (aws/secretsmanager) or a customer managed key that was created in AWS Key Management Service (AWS KMS). The rule is compliant if a secret is encrypted using a customer managed key. This rule is non compliant if a secret is encrypted using aws/secretsmanager."
  query       = query.secretsmanager_secret_encrypted_with_kms_cmk

  tags = merge(local.conformance_pack_secretsmanager_common_tags, {
    gxp_21_cfr_part_11 = "true"
    nist_800_53_rev_5  = "true"
  })
}

control "secretsmanager_secret_last_changed_90_day" {
  title       = "Secrets Manager secrets should be rotated within specific number of days."
  description = "Ensure if AWS Secrets Manager secrets have been rotated in the past specified number of days. The rule is non compliant if a secret has not been rotated for more than 'maxDaysSinceRotation' number of days. The default value is 90 days."
  query       = query.secretsmanager_secret_last_changed_90_day

  tags = merge(local.conformance_pack_secretsmanager_common_tags, {
    cisa_cyber_essentials = "true"
  })
}
