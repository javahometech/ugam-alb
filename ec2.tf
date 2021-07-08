resource "aws_key_pair" "web_api_key" {
  key_name   = "web-api-key"
  public_key = file("./scripts/web-api-key.pub")
}

resource "aws_instance" "web" {
  ami                         = "ami-0ab4d1e9cf9a1215a"
  instance_type               = "t2.micro"
  subnet_id                   = module.networking.pub_sub_ids[0]
  associate_public_ip_address = true
  availability_zone           = module.networking.azs[0]
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  user_data                   = file("./scripts/ms1-apache.sh")
  key_name                    = aws_key_pair.web_api_key.key_name
  tags = {
    Name = "payments service"
  }
}

resource "aws_instance" "web2" {
  ami                         = "ami-0ab4d1e9cf9a1215a"
  instance_type               = "t2.micro"
  subnet_id                   = module.networking.pub_sub_ids[1]
  associate_public_ip_address = true
  availability_zone           = module.networking.azs[1]
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  user_data                   = file("./scripts/ms2-apache.sh")
  key_name                    = aws_key_pair.web_api_key.key_name
  tags = {
    Name = "orders service"
  }
}