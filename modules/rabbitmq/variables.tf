# Copyright (c) 2022 Canonical Ltd.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
# implied.
# See the License for the specific language governing permissions and
# limitations under the License.

variable "name" {
  description = "Name of the deployed RabbitMQ K8S operator"
  type        = string
  default     = "rabbitmq"
}

variable "channel" {
  description = "RabbitMQ K8S charm channel"
  type        = string
  default     = "latest/edge"
}

variable "revision" {
  description = "RabbitMQ K8S charm channel revision"
  type        = number
  default     = null
}

variable "scale" {
  description = "Scale of RabbitMQ charm"
  type        = number
  default     = 1
}

variable "model" {
  description = "Juju model to deploy resources in"
  type        = string
}

variable "resource-configs" {
  description = "Configs to set for mysql"
  type        = map(string)
  default     = {}
}

variable "logging-app" {
  description = "Name of application providing logging endpoint"
  type        = string
  default     = null
}
