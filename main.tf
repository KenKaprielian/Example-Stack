provider "aws" {
  region = "us-east-1"
}

resource "aws_sns_topic" "sns-topic" {
  name         = "example-sns-topic"
  display_name = "example"
}

resource "aws_sqs_queue" "sqs-queue" {
  name     = "example-sqs-queue"
}

resource "aws_sns_topic_subscription" "sns-topic" {
  topic_arn = aws_sns_topic.sns-topic.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.sqs-queue.arn
}
