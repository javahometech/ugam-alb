variable "vpc_id" {
  
}

variable "app_name" {
  default = "ugam-app"
}

variable "subnet_ids" {
  
}

variable "default_tg_arn" {
  
}

variable "web_sg_ingress" {
  type = map(object({
    port        = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = {
    "80" = {
      cidr_blocks = ["0.0.0.0/0"]
      port        = 80
      protocol    = "tcp"
    }
  }
}