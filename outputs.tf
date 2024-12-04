output "ec2_public_dns" {
  description = "Public DNS of the EC2 instance"
  value       = module.ec2.instance_public_dns
}

output "cloudfront_domain_name" {
  description = "CloudFront distribution domain"
  value       = module.cloudfront.cloudfront_domain_name
}