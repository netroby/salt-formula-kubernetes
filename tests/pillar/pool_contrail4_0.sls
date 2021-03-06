kubernetes:
  common:
    cluster_domain: cluster.local
    cluster_name: cluster
    network:
      engine: none
    hyperkube:
      image: hyperkube-amd64:v1.6.4-3
      hash: hnsj0XqABgrSww7Nqo7UVTSZLJUt2XRd
    addons:
      dns:
        domain: cluster.local
        enabled: false
        replicas: 1
        server: 10.254.0.10
        autoscaler:
          enabled: true
      virtlet:
        enabled: true
        namespace: kube-system
        image: mirantis/virtlet:v0.8.0
        hosts:
        - cmp01
        - cmp02
  pool:
    enabled: true
    version: v1.2.0
    host:
      name: ${linux:system:name}
    apiserver:
      host: 127.0.0.1
      secure_port: 443
      insecure:
        enabled: True
      insecure_port: 8080
      members:
        - host: 127.0.0.1
        - host: 127.0.0.1
        - host: 127.0.0.1
    address: 0.0.0.0
    kubelet:
      address: 127.0.0.1
      config: /etc/kubernetes/manifests
      allow_privileged: True
      frequency: 5s
    token:
      kubelet: 7bN5hJ9JD4fKjnFTkUKsvVNfuyEddw3r
      kube_proxy: DFvQ8GelB7afH3wClC9romaMPhquyyEe
    ca: kubernetes
    network:
      engine: opencontrail
      version: 4.0
      config:
        api:
          host: 127.0.0.1
