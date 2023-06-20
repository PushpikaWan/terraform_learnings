resource "aws_instance" "my_server" {
  ami           = "" //get this from aws
  instance_type = var.instance_type   //"t2.micro"

  tags = {
    Name = "MyServer-${local.project_name}"
  }
}
