resource "aws_key_pair" "dove_key" {
  key_name   = "dovekey"
  public_key = file(var.PUB_KEY)
}
resource "aws_instance" "dove-web" {
  ami                    = var.amis[var.region]
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.dove-pub-1.id
  key_name               = aws_key_pair.dove_key.key_name
  vpc_security_group_ids = [aws_security_group.dove_stack_sg.id]
  tags = {
    Name = "MY-DOVE"
  }
}

resource "aws_ebs_volume" "vol_4_dove" {
  availability_zone = var.zone1
  size              = 3
  tags = {
    Name = "extr-vol-4-dove"
  }

}

resource "aws_volume_attachment" "atch_vol_dove" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.vol_4_dove.id
  instance_id = aws_instance.dove-web.id

}

output "publicIp" {
  value = aws_instance.dove-web.public_ip
}