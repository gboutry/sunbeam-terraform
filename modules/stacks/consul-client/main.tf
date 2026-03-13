# Terraform manifest for deployment of Consul client
#
# SPDX-FileCopyrightText: 2024 - Canonical Ltd
# SPDX-License-Identifier: Apache-2.0

terraform {
  required_providers {
    juju = {
      source  = "juju/juju"
      version = "= 0.23.1"
    }
  }
}

module "consul-management" {
  count             = var.enable-consul-management ? 1 : 0
  source            = "./modules/consul-client"
  name              = "consul-client-management"
  channel           = var.consul-channel
  revision          = var.consul-revision
  resource-configs  = merge(var.consul-config, lookup(var.consul-config-map, "consul-management", {}))
  endpoint-bindings = lookup(var.consul-endpoint-bindings-map, "consul-management", [])

  principal-application       = var.principal-application
  principal-application-model = var.principal-application-model

  consul-cluster-offer-url = var.consul-management-cluster-offer-url
}

module "consul-tenant" {
  count             = var.enable-consul-tenant ? 1 : 0
  source            = "./modules/consul-client"
  name              = "consul-client-tenant"
  channel           = var.consul-channel
  revision          = var.consul-revision
  resource-configs  = merge(var.consul-config, lookup(var.consul-config-map, "consul-tenant", {}))
  endpoint-bindings = lookup(var.consul-endpoint-bindings-map, "consul-tenant", [])

  principal-application       = var.principal-application
  principal-application-model = var.principal-application-model

  consul-cluster-offer-url = var.consul-tenant-cluster-offer-url
}

module "consul-storage" {
  count             = var.enable-consul-storage ? 1 : 0
  source            = "./modules/consul-client"
  name              = "consul-client-storage"
  channel           = var.consul-channel
  revision          = var.consul-revision
  resource-configs  = merge(var.consul-config, lookup(var.consul-config-map, "consul-storage", {}))
  endpoint-bindings = lookup(var.consul-endpoint-bindings-map, "consul-storage", [])

  principal-application       = var.principal-application
  principal-application-model = var.principal-application-model

  consul-cluster-offer-url = var.consul-storage-cluster-offer-url
}
