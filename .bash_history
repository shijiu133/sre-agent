ip a
nmtui
vi /etc/ssh/sshd_config
systemctl restart sshd
nmtui
reboot
ping qq.com
dnf install -y ansible-core sshpass
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
ssh-copy-id -o StrictHostKeyChecking=no root@k8s-node1
systemctl stastu sshd
systemctl status sshd
ssh-copy-id -o StrictHostKeyChecking=no root@k8s-node2
vim /etc/ssh/sshd_config
dnf vim
yum -y install vim
vim /etc/ssh/ssh_config
vim /etc/ssh/sshd_config
systemctl restart sshd
ssh-copy-id -o StrictHostKeyChecking=no root@k8s-node1
vim /etc/ssh/sshd_config
systemctl restart sshd
vim /etc/ssh/sshd_config
systemctl restart sshd
ssh-copy-id -o StrictHostKeyChecking=no root@k8s-node1
ping 198.18.0.33
telnet 198.18.0.33 22
nc -zv 198.18.0.33 22
# 在远程主机上查看配置
grep -E "PermitRootLogin|AllowUsers|AllowGroups|DenyUsers|DenyGroups" /etc/ssh/sshd_config
ssh-copy-id -o StrictHostKeyChecking=no root@k8s-node1
journalctl -u sshd -f
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
ssh-copy-id -o StrictHostKeyChecking=no root@k8s-node1
vim /etc/hosts 
ssh-copy-id -o StrictHostKeyChecking=no root@k8s-node1
ssh-copy-id -o StrictHostKeyChecking=no root@k8s-node2
ssh-copy-id -o StrictHostKeyChecking=no root@k8s-node3
mkdir -p ~/ansible-k8s-deployment
cd ~/ansible-k8s-deployment
vim ~/ansible-k8s-deployment/ansible.cfg
vim ~/ansible-k8s-deployment/inventory
tree
yum install -y tree
vim ~/ansible-k8s-deployment/deploy-k8s.yml
mkdir -p roles/{common,master,worker}/tasks
tree
vim ~/ansible-k8s-deployment/roles/common/tasks/main.yml
vim ~/ansible-k8s-deployment/roles/master/tasks/main.yml
vim ~/ansible-k8s-deployment/roles/worker/tasks/main.yml
ansible-playbook deploy-k8s.yml 
ll
vim ~/ansible-k8s-deployment/requirements.yml
ansible-galaxy install -r requirements.yml
ansible-playbook deploy-k8s.yml
vim ~/ansible-k8s-deployment/roles/worker/tasks/main.yml
ansible-playbook deploy-k8s.yml
cd ansible-k8s-deployment/
ll
ansible-playbook deploy-k8s.yml
kubelet
kubectl get pod -A
ufw status
firewall status
systemctl status firewalld
systemctl stop firewalld
systemctl disable firewalld
ansible-playbook deploy-k8s.yml
kubectl get nodes -o wide
kubectl get pods -A
cd ~
dnf install -y git tar
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
helm version
git clone https://github.com/shijiu133/sre-agent-gitops.git
ll
cd sre-agent-gitops/
mkdir -p apps/ollama
tree
cat > apps/ollama/ollama.yaml <<'EOF'
apiVersion: v1
kind: Namespace
metadata:
  name: ai-services
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ollama
  namespace: ai-services
spec:
  replicas: 1
  selector:
    matchLabels: { app: ollama }
  template:
    metadata:
      labels: { app: ollama }
    spec:
      containers:
      - name: ollama
        image: ollama/ollama:latest
        ports:
        - containerPort: 11434
---
apiVersion: v1
kind: Service
metadata:
  name: ollama-service
  namespace: ai-services
spec:
  type: NodePort
  selector: { app: ollama }
  ports:
  - port: 11434
    targetPort: 11434
EOF

git add .
git commit -m "feat: Initial setup with Ollama configuration"
git config --global user.email "zfh2107445671@gmail.com"
git config --global user.name "shijiu133"
git push origin main
git add .
git commit -m "feat: Initial setup with Ollama configuration"
git push origin main
cd ~
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
watch kubectl get pods -n argocd
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install prometheus-stack prometheus-community/kube-prometheus-stack --namespace monitoring --create-namespace --version 57.2.0 --set grafana.service.type=NodePort --set prometheus.service.type=NodePort --set alertmanager.service.type=NodePort
watch kubectl get pods -n monitoring
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "NodePort"}}'
kubectl get svc argocd-server -n argocd
kubectl get pod -A
ip a
kubectl get pod -A
kubectl get svc argocd-server -n argocd
kubectl get pods -n argocd
kubectl delete networkpolicy -n argocd --all
root@k8s-master:~# kubectl get deploy,po,svc -n argocd
NAME                                               READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/argocd-applicationset-controller   1/1     1            1           18m
deployment.apps/argocd-dex-server                  1/1     1            1           18m
deployment.apps/argocd-notifications-controller    1/1     1            1           18m
deployment.apps/argocd-redis                       1/1     1            1           18m
deployment.apps/argocd-repo-server                 1/1     1            1           18m
deployment.apps/argocd-server                      1/1     1            1           18m
 
NAME                                                    READY   STATUS    RESTARTS   AGE
pod/argocd-application-controller-0                     1/1     Running   0          18m
pod/argocd-applicationset-controller-655cc58ff8-4b7bj   1/1     Running   0          18m
pod/argocd-dex-server-7d9dfb4fb8-447zb                  1/1     Running   0          18m
pod/argocd-notifications-controller-6c6848bc4c-gmms8    1/1     Running   0          18m
pod/argocd-redis-656c79549c-2zbc9                       1/1     Running   0          18m
pod/argocd-repo-server-856b768fd9-br979                 1/1     Running   0          18m
pod/argocd-server-99c485944-rqznp                       1/1     Running   0          18m
 
NAME                                              TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)                      AGE
service/argocd-applicationset-controller          ClusterIP   10.200.150.131   <none>        7000/TCP,8080/TCP            18m
service/argocd-dex-server                         ClusterIP   10.200.116.20    <none>        5556/TCP,5557/TCP,5558/TCP   18m
service/argocd-metrics                            ClusterIP   10.200.183.3     <none>        8082/TCP                     18m
service/argocd-notifications-controller-metrics   ClusterIP   10.200.183.138   <none>        9001/TCP                     18m
service/argocd-redis                              ClusterIP   10.200.101.160   <none>        6379/TCP                     18m
service/argocd-repo-server                        ClusterIP   10.200.167.8     <none>        8081/TCP,8084/TCP            18m
service/argocd-server                             NodePort    10.200.105.205   <none>        80:30080/TCP,443:32076/TCP   18m
service/argocd-server-metrics                     ClusterIP   10.200.182.238   <none>        8083/TCP                     18m
root@k8s-master:~# 
kubectl get pod -A
kubectl edit svc argocd-server -n argocd
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "NodePort"}}'
kubectl get pod -A -n argocd
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "NodePort"}}'
kubectl get svc argocd-server -n argocd
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
netstat -tulpn | grep 30080
netstat -tulpn
yum install netstat
kubectl get svc argocd-server -n argocd
cat argocd-ingress.yaml
kubectl get svc argocd-server -n argocd
ll
cat argocd
firewall-cmd --zone=public --add-port=8080/tcp --permanent
kubectl port-forward svc/argocd-server -n argocd --address 0.0.0.0 8082:443
ping 192.168.30.12
telnet 192.168.30.12 10250
kubectl get nodes
kubectl get svc -n argocd argocd-server
nc -zv 192.168.30.12 10250
telnet 192.168.30.12 10250
apt install netcat -y
yum install nc -y
nc -zv 192.168.30.12 10250
kubectl port-forward svc/argocd-server -n argocd --address 0.0.0.0 8082:443
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
cat > ollama-app.yaml <<'EOF'
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: ollama
  namespace: argocd
spec:
  project: default
  source:
    repoURL: 'https://github.com/yinling628/sre-agent-gitops.git'
    targetRevision: HEAD
    path: apps/ollama
  destination: { server: 'https://kubernetes.default.svc', namespace: ai-services }
  syncPolicy: { automated: { prune: true, selfHeal: true }, syncOptions: ["CreateNamespace=true"] }
EOF

# prometheus-app.yaml (接管模式)
cat > prometheus-app.yaml <<'EOF'
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: prometheus-stack
  namespace: argocd
  finalizers:
  - resources-finalizer.argocd.argocd.argoproj.io
spec:
  project: default
  destination:
    server: 'https://kubernetes.default.svc'
    namespace: monitoring
  syncPolicy:
    automated: { selfHeal: true } # 只开启自愈，不开启自动修剪
  source:
    repoURL: 'https://prometheus-community.github.io/helm-charts'
    chart: kube-prometheus-stack
    targetRevision: 57.2.0
    helm:
      # Argo CD会用这些values来比对，确保安装的状态一致
      values: |
        grafana:
          service:
            type: NodePort
        prometheus:
          service:
            type: NodePort
        alertmanager:
          service:
            type: NodePort
EOF

kubectl apply -f ollama-app.yaml
kubectl apply -f prometheus-app.yaml
kubectl get pod -A
kubectl get svc -n monitoring
dnf install -y golang
go version
ll
mkdir -p ~/sre-agent
cd ~/sre-agent
go mod init sre-agent
tree
tree ~
pwd
touch main.go
go get k8s.io/client-go@v0.30.0
go get github.com/prometheus/common@v0.53.0
go mod tidy
cd
cat > ~/crash-app.yaml <<EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: crash-app
spec:
  replicas: 1
  selector:
    matchLabels:
      app: crash-app
  template:
    metadata:
      labels:
        app: crash-app
    spec:
      containers:
      - name: main
        image: alpine:latest
        command: ["/bin/sh", "-c", "echo 'I am designed to fail!'; exit 1"]
EOF

kubectl apply -f ~/crash-app.yaml
watch kubectl get pods
cat > ~/pod-crash-rule.yaml <<EOF
apiVersion: monitoring.coreos.com/v1
kind: PrometheusRule
metadata:
  name: pod-crash-alert
  namespace: monitoring
  labels:
    release: prometheus-stack # 确保operator能发现此规则
spec:
  groups:
  - name: kubernetes.rules
    rules:
    - alert: PodCrashLooping
      expr: kube_pod_container_status_waiting_reason{reason="CrashLoopBackOff"} == 1
      for: 1m
      labels:
        severity: critical
      annotations:
        summary: "Pod is crash looping"
        description: "Pod {{ \$labels.namespace }}/{{ \$labels.pod }} is in CrashLoopBackOff state."
EOF

kubectl apply -f ~/pod-crash-rule.yaml
watch kubectl get pods
kubectl get pod -A
OLLAMA_POD=$(kubectl get pods -n ai-services -l app=ollama -o jsonpath='{.items[0].metadata.name}')
echo $
echo $OLLMA_POD
kubectl exec -it $OLLAMA_POD -n ai-services -- ollama pull qwen:0.5b
kubectl exec -it $OLLAMA_POD -n ai-services -- ollama list | grep 'qwen:0.5b'
tree
cd sre-agent
ll
vim main.go
go run main.go
go mod tidy
go run main.go
kubectl get svc -n ai-services
vim main.go
go run main.go
kubectl get pod -A
watch get pod -n argocd
kubectl get pod -A
kubectl get svc argocd-server -n argocd
kubectl port-forward svc/argocd-server -n argocd --address 0.0.0.0 8082:443
kubectl get nodes
systemctl disable firewalld
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
cd sre-agent
ll
go get k8s.io/client-go/rest
go mod tidy
vim main.go
go mod tidy
go run main.go
tree
vim Dockerfile
cd
cd ansible-k8s-deployment/
vim install-docker
ansible-playbook install-docker 
cd ~/sre-agent
docker build -t sre-agent:v1.0 .
docker images
docker save sre-agent:v1.0 -o sre-agent-v1.0.tar
ctr -n k8s.io image import sre-agent-v1.0.tar
ctr -n k8s.io image ls | grep sre-agent
scp sre-agent-v1.0.tar root@k8s-node2:/root
scp sre-agent-v1.0.tar root@k8s-node3:/root
ctr -n k8s.io image import sre-agent-v1.0.tar
cd ~/sre-agent-gitops
mkdir -p apps/sre-agent
tree
vim apps/sre-agent/deployment.yaml
vim apps/sre-agent/rbac.yaml
git add apps/sre-agent/
git commit -m "feat: Add Kubernetes manifests for SRE Agent"
git push origin main
cd
ll
vim sre-agent-app.yaml
kubectl get pods -l app=sre-agent
kubectl apply -f sre-agent-app.yaml 
kubectl get pods -l app=sre-agent
AGENT_POD=$(kubectl get pods -l app=sre-agent -o jsonpath='{.items[0].metadata.name}')
kubectl logs -f $AGENT_POD
vim sre-agent-app.yaml
ll
cd sre-agent
ll
vim main.go
kubectl logs -f $AGENT_POD
kubectl get pod -A
# 检查Ollama服务是否运行
kubectl get pods -n ai-services | findstr ollama
# 查看Ollama服务日志
kubectl logs ollama-5c8bb8bb69-qp9zg -n ai-services
# 检查Ollama中是否有qwen:0.5b模型
kubectl exec -it ollama-5c8bb8bb69-qp9zg -n ai-services -- ollama list
# 测试LLM API调用
$body = '{"model": "qwen:0.5b", "prompt": "Hello", "stream": false}'
Invoke-WebRequest -Uri "http://192.168.30.11:30756/api/generate" -Method POST -Body $body -ContentType "application/json"
# 重启SRE Agent Pod
kubectl delete pod sre-agent-5d64886f5f-6tbmc -n default
# 1. 检查新的SRE Agent是否启动
kubectl get pods -n default | findstr sre-agent
# 2. 查看新SRE Agent的日志
kubectl logs -f deployment/sre-agent -n default
# 3. 检查crash-app的状态
kubectl get pods -n default | findstr crash-app
kubectl exec -it ollama-5c8bb8bb69-qp9zg -n ai-services -- ollama list
history
kubectl exec -it ollama-5c8bb8bb69-qp9zg -n ai-services -- ollama list
# 检查模型列表
kubectl exec -it ollama-5c8bb8bb69-qp9zg -n ai-services -- ollama list
# 测试API调用
curl -X POST http://192.168.30.11:30756/api/generate   -H "Content-Type: application/json"   -d '{"model": "qwen:0.5b", "prompt": "test", "stream": false}'
reboot
watch kubectl get pods
kubetctl get pod -A
ll
kubetctl get pod -A
kubectl get pod -A
kubectl logs -f $AGENT_POD
kubectl get pods -l app=sre-agent
AGENT_POD=$(kubectl get pods -l app=sre-agent -o jsonpath='{.items[0].metadata.name}')
kubectl logs -f $AGENT_POD
# 创建PVC，为Ollama提供持久化存储
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: ollama-pvc
  namespace: ai-services
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 10Gi
EOF

# 为Ollama部署添加持久化存储
kubectl patch deployment ollama -n ai-services -p '{
  "spec": {
    "template": {
      "spec": {
        "containers": [{
          "name": "ollama",
          "volumeMounts": [{
            "name": "ollama-data",
            "mountPath": "/root/.ollama"
          }]
        }],
        "volumes": [{
          "name": "ollama-data",
          "persistentVolumeClaim": {
            "claimName": "ollama-pvc"
          }
        }]
      }
    }
  }
}'
# 查看Pod重启状态
kubectl get pods -n ai-services -w
kubectl get pods -n ai-services 
kubectl get pods -n ai-services -w
kubectl get pvc -n ai-services
# 1. 检查可用的存储类
kubectl get storageclass
# 2. 查看PVC详细信息
kubectl describe pvc ollama-pvc -n ai-services
# 3. 检查是否有可用的持久卷
kubectl get pv
# 删除当前的PVC
kubectl delete pvc ollama-pvc -n ai-services
# 创建hostPath持久卷
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: PersistentVolume
metadata:
  name: ollama-pv
spec:
  capacity:
    storage: 10Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: /data/ollama
  persistentVolumeReclaimPolicy: Retain
EOF

# 创建PVC，绑定到我们创建的PV
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: ollama-pvc
  namespace: ai-services
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 10Gi
  volumeName: ollama-pv
EOF

# 检查PV状态
kubectl get pv
# 检查PVC状态
kubectl get pvc -n ai-services
# 查看PV详细信息
kubectl describe pv ollama-pv
# 查看PVC详细信息
kubectl describe pvc ollama-pvc -n ai-services
kubectl get pvc -n ai-services
kubectl get pods -n ai-services 
kubectl exec -it deployment/ollama -n ai-services -- ollama pull qwen:0.5b
kubectl get pv,pvc -n ai-services
kubectl exec -it deployment/ollama -n ai-services -- ollama list
kubectl delete pod -l app=sre-agent -n default
kubectl get pods -l app=sre-agent
AGENT_POD=$(kubectl get pods -l app=sre-agent -o jsonpath='{.items[0].metadata.name}')
kubectl logs -f $AGENT_POD
kubectl exec -it deployment/ollama -n ai-services -- ollama pull qwen:0.5b
kubectl exec -it deployment/ollama -n ai-services -- ollama list
kubectl delete pod -l app=sre-agent -n default~
kubectl delete pod -l app=sre-agent -n default
kubectl exec -it deployment/ollama -n ai-services -- ollama list
kubectl logs -f $AGENT_POD
AGENT_POD=$(kubectl get pods -l app=sre-agent -o jsonpath='{.items[0].metadata.name}')
kubectl logs -f $AGENT_POD
reboot
kubectl get deployment ollama -n ai-services -o yaml
kubectl get deployment ollama -n ai-services -o yaml | grep [200~ lastUpdateTime: "2025-10-23T14:51:29Z"
kubectl get deployment ollama -n ai-services -o yaml | grep volumeMounts
watch kubectl get pods
kubectl get pod
kubectl get pod -A
kubectl get pod -A -w
kubectl get pod -A
kubectl get pod
kubectl get pod -n argo
kubectl get pod 
kubectl get pod -A
kubectl get pod -n argo
kubectl get pod -n argocd
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
argocd repo list
cat /etc/host
cat /etc/hosts
ssh k8s-node1 date
ssh k8s-node2 date
ssh k8s-node3 date
free
systemd kubelet
ll
poweroff
kubectl get pod -A
kubectl get pod
kubectl get pod -A
curl -v https://registry-1.docker.io
ping qq.com
curl -v https://registry-1.docker.io
reboot
kubectl get_helm.sh node
kubectl get nodes
kubectl get pod
kubectl get pod -A
kubectl get pod -A -o w
kubectl get pod -A w
kubectl get pod -A -w
kubectl get svc -n ai-services
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
kubectl get pod -A
kubectl get pod
kubectl get pv
kubetctl descrbie svc -n ai-services
kubetctl describe svc -n ai-services
kubectl describe svc -n ai-services
kubectl describe deploment -n ai-services
kubectl desceibe deploment
kubectl describe deploment
kubectl describe svc ollama-app.yaml 
kubectl describe svc ollama
kubectl get pod -A
kubectl describe pod -n ai-services
kubectl get pod -l
kubectl get pods -l
kubectl get pods -l app=sre-agent
AGENT_POD=$(kubectl get pods -l app=sre-agent -o jsonpath='{.items[0].metadata.name}')
kubectl logs -f $AGENT_POD
kubectl get pods --show-deleted 
kubectl get pods --show-deleted -n default
ll
cd sre-agent
ll
cd ..
ll
cat anaconda-ks.cfg 
kubectl get node
kubectl get pod -A
[200~AGENT_POD=$(kubectl get pods -l app=sre-agent -o jsonpath='{.items[0].metadata.name}')
kubectl logs -f sre-agent-5d64886f5f-dwj8l
