## AMI 가져오기
data "aws_ami" "amzn" { 
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["amazon"] # Canonical
}

## bastion에 쓸 탄력적IP 부여
resource "aws_eip" "eip_bastion" { 
  vpc = true
}

## bastion EC2 생성
resource "aws_instance" "Bastion" {
  ami                    = data.aws_ami.amzn.id
  instance_type          = "t2.micro"
  key_name               = "team.key"
  vpc_security_group_ids = [aws_security_group.Bastion-sg.id]
  availability_zone      = "ap-northeast-2a"
  #   private_ip                  = "10.0.0.15"
  subnet_id = aws_subnet.PUB_a.id
  #   associate_public_ip_address = true      ## 여기서 공인 IP 할당 시, IP값 고정 안됨! EIP 활용필요 
  #   user_data                   = file("./install.sh")
  tags = {
    Name = "Bastion"
  }
}

## Bastion에 EIP 부여
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.Bastion.id
  allocation_id = aws_eip.eip_bastion.id
}

# output "public_ip" {  ## output = 터미널에 지시한 결과값 내놓을 수 있음.  
#   value = aws_instance.jylee_web_A.public_ip  ## 생성한 인스턴스 공인 IP값 내놓도록 설정
# }
