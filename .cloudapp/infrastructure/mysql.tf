resource "random_password" "db" {
  length           = 16
  override_special = "_+-&=!@#$%^*()"
}

resource "tencentcloud_mysql_instance" "demo_mysql" {
  # VPC ID（从安装参数表单获取）
  vpc_id = var.app_target.vpc.id
  # 子网 ID（从安装参数表单获取）
  subnet_id = var.app_target.subnet.id
  # 实例内存大小，单位：MB
  mem_size = 1000
  # 实例硬盘大小，单位：GB
  volume_size = 50
  # MySQL 版本，值包括：5.5、5.6 、5.7 、8.0
  engine_version = "5.7"
  # 设置 root 账号密码，密码规则：8 - 64 个字符，至少包含字母、数字、字符（支持的字符：_+-&=!@#$%^*()）中的两种，购买主实例时可指定该参数，购买只读实例或者灾备实例时指定该参数无意义。
  root_password = random_password.db.result
  # 可用区
  availability_zone = "ap-guangzhou-6"
  # 安全组 ID 列表，可以传多个
  security_groups = [var.security_group.security_group.id]
  # 自定义端口，端口支持范围：[ 1024-65535 ] 。默认 3306
  intranet_port = 3306
}
