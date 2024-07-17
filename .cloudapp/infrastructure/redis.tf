resource "random_password" "redis" {
  length           = 16
  override_special = "_+-&=!@#$%^*()"
}

resource "tencentcloud_redis_instance" "demo_redis" {
  # VPC ID（从安装参数表单获取）
  vpc_id = var.app_target.vpc.id
  # 子网 ID（从安装参数表单获取）
  subnet_id = var.app_target.subnet.id
  # 可用区
  availability_zone = "ap-guangzhou-6"
  # 实例类型（例：Redis 4.0 内存版（标准架构）） 详情参考 https://cloud.tencent.com/document/product/239/20026#2.-.E8.BE.93.E5.85.A5.E5.8F.82.E6.95.B0
  type_id = 6
  # 密码
  password = random_password.redis.result
  # 内存容量，单位：MB
  mem_size = 2048
  # 自定义端口号
  port = 6379
}
