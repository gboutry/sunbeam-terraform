module "sunbeam-machine" {
  count  = length(var.sunbeam_machine) > 0 ? 1 : 0
  source = "./modules/stacks/sunbeam-machine"

  machine_ids                        = lookup(var.sunbeam_machine, "machine_ids", [])
  charm_channel                      = lookup(var.sunbeam_machine, "charm_channel", "2024.1/stable")
  charm_revision                     = lookup(var.sunbeam_machine, "charm_revision", null)
  charm_config                       = lookup(var.sunbeam_machine, "charm_config", {})
  machine_model                      = lookup(var.sunbeam_machine, "machine_model", null)
  endpoint_bindings                  = lookup(var.sunbeam_machine, "endpoint_bindings", null)
  charm_epa_orchestrator_channel     = lookup(var.sunbeam_machine, "charm_epa_orchestrator_channel", "2024.1/stable")
  charm_epa_orchestrator_revision    = lookup(var.sunbeam_machine, "charm_epa_orchestrator_revision", null)
  charm_epa_orchestrator_config      = lookup(var.sunbeam_machine, "charm_epa_orchestrator_config", {})
  epa_orchestrator_endpoint_bindings = lookup(var.sunbeam_machine, "epa_orchestrator_endpoint_bindings", null)
}

module "microovn-stack" {
  count  = length(var.microovn) > 0 ? 1 : 0
  source = "./modules/stacks/microovn"

  charm_microovn_channel                        = lookup(var.microovn, "charm_microovn_channel", "24.03/stable")
  charm_microovn_revision                       = lookup(var.microovn, "charm_microovn_revision", null)
  charm_microovn_config                         = lookup(var.microovn, "charm_microovn_config", {})
  charm_openstack_network_agents_channel        = lookup(var.microovn, "charm_openstack_network_agents_channel", "2024.1/stable")
  charm_openstack_network_agents_revision       = lookup(var.microovn, "charm_openstack_network_agents_revision", null)
  charm_openstack_network_agents_config         = lookup(var.microovn, "charm_openstack_network_agents_config", {})
  charm_microcluster_token_distributor_channel  = lookup(var.microovn, "charm_microcluster_token_distributor_channel", "latest/edge")
  charm_microcluster_token_distributor_revision = lookup(var.microovn, "charm_microcluster_token_distributor_revision", null)
  charm_microcluster_token_distributor_config   = lookup(var.microovn, "charm_microcluster_token_distributor_config", {})
  charm_sunbeam_ovn_proxy_channel               = lookup(var.microovn, "charm_sunbeam_ovn_proxy_channel", "2024.1/stable")
  charm_sunbeam_ovn_proxy_revision              = lookup(var.microovn, "charm_sunbeam_ovn_proxy_revision", null)
  charm_sunbeam_ovn_proxy_config                = lookup(var.microovn, "charm_sunbeam_ovn_proxy_config", {})
  microovn_machine_ids                          = lookup(var.microovn, "microovn_machine_ids", [])
  token_distributor_machine_ids                 = lookup(var.microovn, "token_distributor_machine_ids", [])
  machine_model                                 = lookup(var.microovn, "machine_model", null)
  endpoint_bindings                             = lookup(var.microovn, "endpoint_bindings", null)
  ca-offer-url                                  = lookup(var.microovn, "ca-offer-url", null)
  ovn-relay-offer-url                           = lookup(var.microovn, "ovn-relay-offer-url", null)
}

module "microceph-stack" {
  count  = length(var.microceph) > 0 ? 1 : 0
  source = "./modules/stacks/microceph"

  charm_microceph_channel      = lookup(var.microceph, "charm_microceph_channel", "squid/stable")
  charm_microceph_revision     = lookup(var.microceph, "charm_microceph_revision", null)
  charm_microceph_config       = lookup(var.microceph, "charm_microceph_config", {})
  microceph_channel            = lookup(var.microceph, "microceph_channel", "squid/stable")
  machine_ids                  = lookup(var.microceph, "machine_ids", [])
  machine_model                = lookup(var.microceph, "machine_model", null)
  endpoint_bindings            = lookup(var.microceph, "endpoint_bindings", null)
  keystone-endpoints-offer-url = lookup(var.microceph, "keystone-endpoints-offer-url", null)
  ingress-rgw-offer-url        = lookup(var.microceph, "ingress-rgw-offer-url", null)
  cert-distributor-offer-url   = lookup(var.microceph, "cert-distributor-offer-url", null)
}

module "hypervisor-stack" {
  count  = length(var.hypervisor) > 0 ? 1 : 0
  source = "./modules/stacks/hypervisor"

  machine_ids                         = lookup(var.hypervisor, "machine_ids", [])
  snap_channel                        = lookup(var.hypervisor, "snap_channel", "2024.1/stable")
  charm_channel                       = lookup(var.hypervisor, "charm_channel", "2024.1/stable")
  charm_revision                      = lookup(var.hypervisor, "charm_revision", null)
  charm_config                        = lookup(var.hypervisor, "charm_config", {})
  openstack_model                     = lookup(var.hypervisor, "openstack_model", null)
  machine_model                       = lookup(var.hypervisor, "machine_model", null)
  endpoint_bindings                   = lookup(var.hypervisor, "endpoint_bindings", null)
  rabbitmq-offer-url                  = lookup(var.hypervisor, "rabbitmq-offer-url", null)
  keystone-offer-url                  = lookup(var.hypervisor, "keystone-offer-url", null)
  cert-distributor-offer-url          = lookup(var.hypervisor, "cert-distributor-offer-url", null)
  ca-offer-url                        = lookup(var.hypervisor, "ca-offer-url", null)
  ovn-relay-offer-url                 = lookup(var.hypervisor, "ovn-relay-offer-url", null)
  ceilometer-offer-url                = lookup(var.hypervisor, "ceilometer-offer-url", null)
  cinder-volume-ceph-application-name = lookup(var.hypervisor, "cinder-volume-ceph-application-name", null)
  nova-offer-url                      = lookup(var.hypervisor, "nova-offer-url", null)
  masakari-offer-url                  = lookup(var.hypervisor, "masakari-offer-url", null)
}

module "cinder-volume-stack" {
  count  = length(var.cinder_volume) > 0 ? 1 : 0
  source = "./modules/stacks/cinder-volume"

  charm_cinder_volume_channel          = lookup(var.cinder_volume, "charm_cinder_volume_channel", "2024.1/stable")
  charm_cinder_volume_revision         = lookup(var.cinder_volume, "charm_cinder_volume_revision", null)
  charm_cinder_volume_config           = lookup(var.cinder_volume, "charm_cinder_volume_config", {})
  cinder_volume_channel                = lookup(var.cinder_volume, "cinder_volume_channel", "2024.1/stable")
  charm_cinder_volume_ceph_channel     = lookup(var.cinder_volume, "charm_cinder_volume_ceph_channel", "2024.1/stable")
  charm_cinder_volume_ceph_revision    = lookup(var.cinder_volume, "charm_cinder_volume_ceph_revision", null)
  charm_cinder_volume_ceph_config      = lookup(var.cinder_volume, "charm_cinder_volume_ceph_config", {})
  machine_ids                          = lookup(var.cinder_volume, "machine_ids", [])
  machine_model                        = lookup(var.cinder_volume, "machine_model", null)
  endpoint_bindings                    = lookup(var.cinder_volume, "endpoint_bindings", null)
  cinder_volume_ceph_endpoint_bindings = lookup(var.cinder_volume, "cinder_volume_ceph_endpoint_bindings", null)
  keystone-offer-url                   = lookup(var.cinder_volume, "keystone-offer-url", null)
  amqp-offer-url                       = lookup(var.cinder_volume, "amqp-offer-url", null)
  database-offer-url                   = lookup(var.cinder_volume, "database-offer-url", null)
  cert-distributor-offer-url           = lookup(var.cinder_volume, "cert-distributor-offer-url", null)
  ceph-application-name                = lookup(var.cinder_volume, "ceph-application-name", null)
  enable-telemetry-notifications       = lookup(var.cinder_volume, "enable-telemetry-notifications", false)
}

module "storage-stack" {
  count  = length(var.storage) > 0 ? 1 : 0
  source = "./modules/stacks/storage"

  model          = lookup(var.storage, "model", null)
  cinder-volumes = lookup(var.storage, "cinder-volumes", {})
  backends       = lookup(var.storage, "backends", {})
}

module "consul-client-stack" {
  count  = length(var.consul_client) > 0 ? 1 : 0
  source = "./modules/stacks/consul-client"

  principal-application               = lookup(var.consul_client, "principal-application", "openstack-hypervisor")
  principal-application-model         = lookup(var.consul_client, "principal-application-model", "controller")
  consul-channel                      = lookup(var.consul_client, "consul-channel", "latest/edge")
  consul-revision                     = lookup(var.consul_client, "consul-revision", null)
  consul-config                       = lookup(var.consul_client, "consul-config", {})
  consul-config-map                   = lookup(var.consul_client, "consul-config-map", {})
  consul-endpoint-bindings-map        = lookup(var.consul_client, "consul-endpoint-bindings-map", null)
  enable-consul-management            = lookup(var.consul_client, "enable-consul-management", false)
  enable-consul-tenant                = lookup(var.consul_client, "enable-consul-tenant", false)
  enable-consul-storage               = lookup(var.consul_client, "enable-consul-storage", false)
  consul-management-cluster-offer-url = try(one(module.consul-management[*].consul-cluster-offer-url), null)
  consul-tenant-cluster-offer-url     = try(one(module.consul-tenant[*].consul-cluster-offer-url), null)
  consul-storage-cluster-offer-url    = try(one(module.consul-storage[*].consul-cluster-offer-url), null)
}

module "observability-cos-stack" {
  count  = length(var.observability_cos) > 0 ? 1 : 0
  source = "./modules/stacks/observability-cos"

  model                 = lookup(var.observability_cos, "model", "cos")
  cloud                 = lookup(var.observability_cos, "cloud", "k8s")
  region                = lookup(var.observability_cos, "region", "localhost")
  credential            = lookup(var.observability_cos, "credential", "")
  config                = lookup(var.observability_cos, "config", {})
  cos-channel           = lookup(var.observability_cos, "cos-channel", "latest/stable")
  traefik-channel       = lookup(var.observability_cos, "traefik-channel", "latest/stable")
  traefik-revision      = lookup(var.observability_cos, "traefik-revision", null)
  traefik-config        = lookup(var.observability_cos, "traefik-config", {})
  alertmanager-channel  = lookup(var.observability_cos, "alertmanager-channel", "latest/stable")
  alertmanager-revision = lookup(var.observability_cos, "alertmanager-revision", null)
  alertmanager-config   = lookup(var.observability_cos, "alertmanager-config", {})
  prometheus-channel    = lookup(var.observability_cos, "prometheus-channel", "latest/stable")
  prometheus-revision   = lookup(var.observability_cos, "prometheus-revision", null)
  prometheus-config     = lookup(var.observability_cos, "prometheus-config", {})
  grafana-channel       = lookup(var.observability_cos, "grafana-channel", "latest/stable")
  grafana-revision      = lookup(var.observability_cos, "grafana-revision", null)
  grafana-config        = lookup(var.observability_cos, "grafana-config", {})
  catalogue-channel     = lookup(var.observability_cos, "catalogue-channel", "latest/stable")
  catalogue-revision    = lookup(var.observability_cos, "catalogue-revision", null)
  catalogue-config      = lookup(var.observability_cos, "catalogue-config", {})
  loki-channel          = lookup(var.observability_cos, "loki-channel", "latest/stable")
  loki-revision         = lookup(var.observability_cos, "loki-revision", null)
  loki-config           = lookup(var.observability_cos, "loki-config", {})
  ingress-scale         = lookup(var.observability_cos, "ingress-scale", 1)
  alertmanager-scale    = lookup(var.observability_cos, "alertmanager-scale", 1)
  prometheus-scale      = lookup(var.observability_cos, "prometheus-scale", 1)
  grafana-scale         = lookup(var.observability_cos, "grafana-scale", 1)
  catalogue-scale       = lookup(var.observability_cos, "catalogue-scale", 1)
  loki-scale            = lookup(var.observability_cos, "loki-scale", 1)
}

module "observability-machine-agent-stack" {
  count  = length(var.observability_machine_agent) > 0 ? 1 : 0
  source = "./modules/stacks/observability-machine-agent"

  observability-agent-integration-apps = lookup(var.observability_machine_agent, "observability-agent-integration-apps", [])
  principal-application-model          = lookup(var.observability_machine_agent, "principal-application-model", "controller")
  opentelemetry-collector-channel      = lookup(var.observability_machine_agent, "opentelemetry-collector-channel", "2/stable")
  opentelemetry-collector-revision     = lookup(var.observability_machine_agent, "opentelemetry-collector-revision", null)
  opentelemetry-collector-base         = lookup(var.observability_machine_agent, "opentelemetry-collector-base", "ubuntu@24.04")
  opentelemetry-collector-config       = lookup(var.observability_machine_agent, "opentelemetry-collector-config", {})
  receive-remote-write-offer-url       = lookup(var.observability_machine_agent, "receive-remote-write-offer-url", null)
  grafana-dashboard-offer-url          = lookup(var.observability_machine_agent, "grafana-dashboard-offer-url", null)
  logging-offer-url                    = lookup(var.observability_machine_agent, "logging-offer-url", null)
}

module "ubuntu-pro-stack" {
  count  = length(var.ubuntu_pro) > 0 ? 1 : 0
  source = "./modules/stacks/ubuntu-pro"

  ubuntu-advantage-channel = lookup(var.ubuntu_pro, "ubuntu-advantage-channel", "latest/edge")
  machine-model            = lookup(var.ubuntu_pro, "machine-model", null)
  token                    = lookup(var.ubuntu_pro, "token", "")
}

module "manila-data-stack" {
  count  = length(var.manila_data) > 0 ? 1 : 0
  source = "./modules/stacks/manila-data"

  charm-manila-data-channel  = lookup(var.manila_data, "charm-manila-data-channel", "2024.1/edge")
  charm-manila-data-revision = lookup(var.manila_data, "charm-manila-data-revision", null)
  charm-manila-data-config   = lookup(var.manila_data, "charm-manila-data-config", {})
  charm_manila_data_config   = lookup(var.manila_data, "charm_manila_data_config", {})
  manila-data-channel        = lookup(var.manila_data, "manila-data-channel", "2024.1/edge")
  machine_ids                = lookup(var.manila_data, "machine_ids", [])
  machine_model              = lookup(var.manila_data, "machine_model", null)
  endpoint_bindings          = lookup(var.manila_data, "endpoint_bindings", null)
  keystone-offer-url         = lookup(var.manila_data, "keystone-offer-url", null)
  amqp-offer-url             = lookup(var.manila_data, "amqp-offer-url", null)
  database-offer-url         = lookup(var.manila_data, "database-offer-url", null)
}
