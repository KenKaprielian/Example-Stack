provider "aws" {
  region = "us-east-1"
}

resource "aws_sqs_queue" "terraform_queue" {
  name                        = "terraform-example-queue.fifo"
  fifo_queue                  = true
  content_based_deduplication = true
}

resource "aws_sns_topic" "user_updates" {
  name = "user-updates-topic"
}
