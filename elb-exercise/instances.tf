resource "aws_instance" "app" {
  count           = 3
  ami             = "ami-08a0d1e16fc3f61ea" # Amazon Linux 2023 AMI
  instance_type   = "t2.micro"
  key_name        = "holiday"
  subnet_id       = element([aws_subnet.subnet1.id, aws_subnet.subnet2.id, aws_subnet.subnet3.id], count.index)
  security_groups = [aws_security_group.public_sg.id]

  tags = {
    Name = "app-instance-${count.index + 1}"
  }
}

output "instance_public_ips" {
  value = aws_instance.app[*].public_ip
}

resource "local_file" "host_inventory" {
  content  = join("\n", concat(["[all]"], [for ip in aws_instance.app[*].public_ip : format("%s ansible_ssh_private_key_file=~/.ssh/holiday.pem ansible_user=ec2-user", ip)]))
  filename = "${path.module}/host-inventory"
}
