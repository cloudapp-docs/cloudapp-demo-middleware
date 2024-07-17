# 用户选择的安装目标位置，VPC 和子网，在 package.yaml 中定义了输入组件
variable "app_target" {
  type = object({
    region    = string
    region_id = string
    vpc = object({
      id         = string
      cidr_block = string
    })
    subnet = object({
      id   = string
      zone = string
    })
  })
}

# 用户选择的安全组，在 package.yaml 中定义了输入组件
variable "security_group" {
  type = object({
    region    = string
    region_id = string
    security_group = object({
      id = string
    })
    security_groups = list(string)
  })
}
