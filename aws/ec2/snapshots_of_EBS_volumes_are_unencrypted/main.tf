resource "aws_instance" "huocorp_terraform_goat_instance" {
  ami           = "ami-0e472ba40eb589f49"
  instance_type = "t2.micro"
}


resource "aws_ebs_snapshot" "huocorp_terraform_goat_snapshot" {
  volume_id = aws_instance.huocorp_terraform_goat_instance.root_block_device[0].volume_id
}