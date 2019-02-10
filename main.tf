resource "aws_autoscaling_group" "this" {
  name                              = var.name
  name_prefix                       = var.name_prefix
  max_size                          = var.max_size
  min_size                          = var.min_size
  availability_zones                = var.availability_zones
  default_cooldown                  = var.default_cooldown
  launch_configuration              = var.launch_configuration
  health_check_grace_period         = var.health_check_grace_period
  health_check_type                 = var.health_check_type
  desired_capacity                  = var.desired_capacity
  force_delete                      = var.force_delete
  load_balancers                    = var.load_balancers
  vpc_zone_identifier               = var.vpc_zone_identifier
  target_group_arns                 = var.target_group_arns
  termination_policies              = var.termination_policies
  suspended_processes               = var.suspended_processes 
  placement_group                   = var.placement_group
  metrics_granularity               = var.metrics_granularity
  enabled_metrics                   = var.enabled_metrics
  wait_for_capacity_timeout         = var.wait_for_capacity_timeout
  min_elb_capacity                  = var.min_elb_capacity
  wait_for_elb_capacity             = var.wait_for_elb_capacity
  protect_from_scale_in             = var.protect_from_scale_in
  service_linked_role_arn           = var.service_linked_role_arn
  tags                              = var.tags

dynamic "tag" {
  for_each = var.tag_inputs == null ? [] : var.tag_inputs

  content {
      key                    = tag.key
      value                  = tag.value
      propagate_at_launch    = tag.propagate_at_launch
  }
}  
  
//launch_template                   
dynamic "launch_template" {
  for_each = var.launch_template_inputs == null ? [] : var.launch_template_inputs

  content {
                      id         = launch_template.value.id 
                      name       = launch_template.value.name
                      version    = launch_template.value.version
  }
}
 
/* 
//mixed_instances_policy           
dynamic "mixed_instances_policy" {
    for_each = var.mixed_instances_policy_inputs == null ? [] : var.mixed_instances_policy_inputs

    content {
              dynamic "instances_distribution" {
                for_each = mixed_instances_policy.value.instances_distribution_inputs == null ? [] : mixed_instances_policy.value.instances_distribution_inputs
                content {
                  on_demand_allocation_strategy             = instances_distribution.value.on_demand_allocation_strategy
                  on_demand_base_capacity                   = instances_distribution.value.on_demand_base_capacity
                  on_demand_percentage_above_base_capacity  = instances_distribution.value.on_demand_percentage_above_base_capacity
                  spot_allocation_strategy                  = instances_distribution.value.spot_allocation_strategy
                  spot_instance_pools                       = instances_distribution.value.spot_instance_pools
                  spot_max_price                            = instances_distribution.value.spot_max_price
                }
              }
              dynamic "launch_template" {
                for_each = mixed_instances_policy.value.launch_template_inputs == null ? [] : mixed_instances_policy.value.launch_template_inputs
                content {
                  dynamic "launch_template_specification" {
                    for_each = launch_template.value.launch_template_specification_inputs == null ? [] : launch_template.value.launch_template_specification_inputs
                    content {
                      launch_template_id                      = launch_template_specification.value.launch_template_id 
                      launch_template_name                    = launch_template_specification.value.launch_template_name
                      version                                 = launch_template_specification.value.version
                    }
                  }
                  dynamic "override" {
                    for_each = launch_template.value.override_inputs == null ? [] : launch_template.value.override_inputs
                    content {
                      instance_type                          = override.value.instance_type
                    }
                  }
                }
              }
            }
}
*/
}



