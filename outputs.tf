output "id" {
    description = "The autoscaling group id."
    value = "${element(concat(aws_autoscaling_group.this.*.id, list("")), 0)}"
}

output "arn" {
    description = "The ARN for this AutoScaling Group"
    value = "${element(concat(aws_autoscaling_group.this.*.arn, list("")), 0)}"
}

output "availability_zones" {
    description = "The availability zones of the autoscale group."
    value = "${element(concat(aws_autoscaling_group.this.*.availability_zones, list("")), 0)}"
}

output "min_size" {
    description = "The minimum size of the autoscale group"
    value = "${element(concat(aws_autoscaling_group.this.*.min_size, list("")), 0)}"
}

output "max_size" {
    description = "The maximum size of the autoscale group"
    value = "${element(concat(aws_autoscaling_group.this.*.max_size, list("")), 0)}"
}

output "default_cooldown" {
    description = "Time between a scaling activity and the succeeding scaling activity."
    value = "${element(concat(aws_autoscaling_group.this.*.default_cooldown, list("")), 0)}"
}

output "name" {
    description = "The name of the autoscale group"
    value = "${element(concat(aws_autoscaling_group.this.*.name, list("")), 0)}"
}

output "health_check_grace_period" {
    description = "Time after instance comes into service before checking health."
    value = "${element(concat(aws_autoscaling_group.this.*.health_check_grace_period, list("")), 0)}"  
}

output "health_check_type" {
    description = "'EC2' or 'ELB'. Controls how health checking is done."
    value = "${element(concat(aws_autoscaling_group.this.*.health_check_type, list("")), 0)}"
}

output "desired_capacity" {
    description = "The number of Amazon EC2 instances that should be running in the group."
    value = "${element(concat(aws_autoscaling_group.this.*.desired_capacity, list("")), 0)}"
}

output "launch_configuration" {
    description = "The launch configuration of the autoscale group"
    value = "${element(concat(aws_autoscaling_group.this.*.launch_configuration, list("")), 0)}"
}

output "vpc_zone_identifier" {
    description = "(Optional) - The VPC zone identifier"
    value = "${element(concat(aws_autoscaling_group.this.*.vpc_zone_identifier, list("")), 0)}"
}

output "load_balancers" {
    description = "(Optional) The load balancer names associated with the autoscaling group."
    value = "${element(concat(aws_autoscaling_group.this.*.load_balancers, list("")), 0)}"
}

output "target_group_arns" {
    description = "(Optional) list of Target Group ARNs that apply to this AutoScaling Group "
    value = "${element(concat(aws_autoscaling_group.this.*.target_group_arns, list("")), 0)}"
}
