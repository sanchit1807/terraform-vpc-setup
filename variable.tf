variable "region" {
  default = "ap-south-1"
}

variable "zone1" {
  default = "ap-south-1a"
}
variable "zone2" {
  default = "ap-south-1b"
}
variable "zone3" {
  default = "ap-south-1c"
}
variable "amis" {
  default = {
    ap-south-1 = "ami-068e0f1a600cd311c"
  }
}
variable "MYIP" {
  default = "223.233.84.233/32"
}

variable "PUB_KEY" {
  default = "dovekey.pub"
}

