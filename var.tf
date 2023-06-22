variable "aws_account_ids" {
  type    = list(string)
  default = ["account_id_1", "account_id_2", "account_id_3", "account_id_4", "account_id_5"]
}

variable "vpc_ids" {
  type    = list(string)
  default = ["vpc_id_1", "vpc_id_2", "vpc_id_3", "vpc_id_4", "vpc_id_5"]
}

variable "subnet_ids" {
  type    = list(list(string))
  default = [
    ["subnet_id_1a", "subnet_id_1b"],
    ["subnet_id_2a", "subnet_id_2b"],
    ["subnet_id_3a", "subnet_id_3b"],
    ["subnet_id_4a", "subnet_id_4b"],
    ["subnet_id_5a", "subnet_id_5b"]
  ]
}