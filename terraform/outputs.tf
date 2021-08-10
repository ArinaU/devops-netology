output "instance_account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "instance_user_id" {
  value = data.aws_caller_identity.current.user_id
}

output "instance_region" {
  value = data.aws_region.current
}

output "count_instances_ip_addr" {
  value = [for device in aws_instance.count_web.* : device.*.private_ip]
}

output "for_each_instances_ip_addr" {
  value = values(aws_instance.for_each_web)[*].private_ip
}

//output "for_each_instances_ip_addr" {
//  value = [for device in aws_instance.for_each_web.* : device.*.arn]
//}

//output "count_instance_subnet_id" {
//  value = formatlist("%v", aws_instance.count_web.*.subnet_id)
//}

//output "for_each_instance_subnet_id" {
//  value = formatlist("%v", aws_instance.for_each_web.*.subnet_id)
//}
