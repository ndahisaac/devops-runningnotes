SETTING UP EKS CLUSTER IN AWS:
# STEPS 1: CREATING IAM ROLE
# Configure cluster
# configure kubectl in my local 
url -o kubectl.exe https://s3.us-west-2.amazonaws.com/amazon-eks/1.21.2/2021-07-05/bin/windows/amd64/kubectl.exe
aws eks --region us-east-2 describe-cluster --name aws-eks --query cluster.status
========================================================================================================================
# Choose How to Install Chocolatey
First, ensure that you are using an administrative shell - you can also install as a non-admin, check out Non-Administrative Installation.
Install with powershell.exe
NOTE: Please inspect https://community.chocolatey.org/install.ps1 prior to running any of these scripts to ensure safety. We already know it's safe, but you should verify the security and contents of any script from the internet you are not familiar with. All of these scripts download a remote PowerShell script and execute it on your machine. We take security very seriously. Learn more about our security protocols.
With PowerShell, you must ensure Get-ExecutionPolicy is not Restricted. We suggest using Bypass to bypass the policy to get things installed or AllSigned for quite a bit more security.

Run Get-ExecutionPolicy. If it returns Restricted, then run Set-ExecutionPolicy AllSigned or Set-ExecutionPolicy Bypass -Scope Process.

# Now run the following command:
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
c
# Installing eksctl in windows: 
choco install -y eksctl 
# Test that your installation was successful with the following command.
eksctl version
==============================================================================================================

# configure aws cli
aws configure
install aws cli
aws sts get-caller-identity
# update the the kubectl in local system and open the location where  the config is created 
aws eks --region us-east-2 update-kubeconfig --name aws-eks
# next type the following the command
kubectl get svc
kubectl get pod
kubectl get all
# creating worker-nodes 
  adding node group
  #creating an IAM ROLE for the node group
  choose EC2 and click next then type : eks and amazoncontainerregistry
 AmazonEKSWorkerNodePolicy	
AmazonEKS_CNI_Policy	
AmazonEC2ContainerRegistryReadOnly
kubectl get nodes --watch
kubectl get nodes
kubectl get pods --all-namespaces

# SETTING UP HELM IN WINDWOS 10
download and extract the zip file go to system properties, select environment variables then edit and new copy(shift+copy) and paste the extracted file save and exit

https://github.com/helm/helm/releases
https://www.youtube.com/watch?v=L3iNhrjQILM
eksctl create cluster --name demo-eks node-type t2.medium --node 3 --nodes-min 3
https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html

https://www.youtube.com/watch?v=SsUnPWp5ilc


==========================================================================================================================
SETTING UP MONITORING IN AMAZON EKS WITH PROMETHEUS AND GRAFANA
#github Repo with commmands :
# add prometheus Helm repo 
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

# add grafana Helm repo
helm repo add grafana https://grafana.github.io/helm-charts

# Deploy Prometheus
kubectl create namespace prometheus
helm install prometheus prometheus-community/prometheus --namespace prometheus --set alertmanager.persistentVolume.storageClass="gp2" --set server.persistentVolume.storageClass="gp2"
	
# Prometheus components deployed as expected
kubectl get all -n prometheus


# kubectl port forwarding
kubectl port-forward -n prometheus deploy/prometheus-server 8080:9090

# Deploy Grafana using below command
kubectl create namespace grafana
helm install grafana grafana/grafana --namespace grafana --set persistence.storageClassName="gp2" --set persistence.enabled=true --set adminPassword='EKS!sAWSome' --values ./grafana.yaml --set service.type=LoadBalancer

# Check if Grafana is deployed
kubectl get all -n grafana

# Get Grafana ELB URL using this command
kubectl get svc -n grafana grafana -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'

# Access dashboard IDs
3119/6417