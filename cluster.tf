
resource "digitalocean_kubernetes_cluster" "geekiam" {
  name    = var.name
  region  = var.region
  version = var.k8s_version

  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-2gb"
    node_count = var.node_count
  }
}
provider "kubernetes" {
  load_config_file = false
  host  = digitalocean_kubernetes_cluster.geekiam.endpoint
  token = digitalocean_kubernetes_cluster.geekiam.kube_config[0].token
  cluster_ca_certificate = base64decode(
    digitalocean_kubernetes_cluster.geekiam.kube_config[0].cluster_ca_certificate
  )
}
