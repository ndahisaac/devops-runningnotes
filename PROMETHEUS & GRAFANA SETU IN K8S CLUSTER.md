PROMETHEUS & GRAFANA SETU IN K8S CLUSTER USING HELM

# Different package manager 
Helm => Chocolatey => yum => apt =>  pip => apk => rpm => brew

# Prometheus Server
 # add helm repo 
 helm repo add stable "https://charts.helm.sh/stable"
 helm repo ls
 # create a namespace
 kubectl create ns monitoring
 # ge prometheus vlaues 
helm show values stable/prometheus>>prometheusvalues.yml
# update premotheus values
  https://github.com/myLandmakTechnology/prometheus-grafana-ELK-EFK