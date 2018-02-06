function aws_s3_delete_bucket() {
  declare s3_bucket_name="$1"

  aws s3 rb --force s3://${s3_bucket_name}
}
