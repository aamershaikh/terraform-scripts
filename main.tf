resource "aws_ecs_cluster" "web-cluster" {
  name               = var.cluster_name
  tags = {
    "env"       = "dev"
    "createdBy" = "aamershaikh"
  }
}

resource "aws_ecs_service" "service" {
  name            = "web-service"
  cluster         = aws_ecs_cluster.web-cluster.id
  task_definition = aws_ecs_task_definition.task-definition-test.arn
  desired_count   = 10
  lifecycle {
    ignore_changes = [desired_count]
  }
  launch_type = "EC2"
}

resource "aws_ecs_task_definition" "task-definition-test" {
  family                = "web-family"
  container_definitions = file("container-definitions/container-def.json")
  tags = {
    "env"       = "dev"
    }
}

#resource "aws_cloudwatch_log_group" "log_group" {
#  name = "/ecs/frontend-container"
#  tags = {
#    "env"       = "dev"
#  }
#}
