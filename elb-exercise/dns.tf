resource "aws_route53_zone" "main" {
  name = "mywonder.works"
}

resource "aws_route53_record" "terraform_test" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "terraform-test.mywonder.works" # Subdomain
  type    = "A"

  alias {
    name                   = aws_elb.app_lb.dns_name
    zone_id                = aws_elb.app_lb.zone_id
    evaluate_target_health = true
  }
}

output "zone_name_servers" {
  value = aws_route53_zone.main.name_servers
}
