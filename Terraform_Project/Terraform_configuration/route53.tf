resource "aws_route53_zone" "main" {
  name = "samanthagloria.me"
}


resource "aws_route53_record" "prod-A" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "terraform-test.samanthagloria.me"
  type    = "A"

    alias {
    name                   = aws_lb.application-lb.dns_name
    zone_id                = aws_lb.application-lb.zone_id
    evaluate_target_health = true
  }
}