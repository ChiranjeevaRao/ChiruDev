## Deploy Kubernetes on AWS Manually [Do not use Eksctl]

### Step By Step Procedure

### _Step 1._

#### Create an EKS cluster

Name: ekscluster-01

Use K8S version 1.28   # Any desired K8 Version.

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/bdc70cf1-e0e6-4620-ad73-8ed063ab299c)

#### Create an IAM role 'eks-cluster-role' with 1 policy attached: AmazonEKSClusterPolicy

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/6f679944-8f33-425c-adae-6c27518cb955)


#### Create another IAM role 'eks-node-grp-role' with 3 policies attached: (Allows EC2 instances to call AWS services on your behalf.)    - AmazonEKSWorkerNodePolicy    - AmazonEC2ContainerRegistryReadOnly    - AmazonEKS_CNI_Policy

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/0155299a-7a6c-4d84-bdf6-1cac9246e3e4)

#### Choose default VPC, Choose 2 or 3 subnets.

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/05e5ec82-9c03-4a49-89ba-596ac910871f)


#### Choose a security group which open the ports 22, 80, 8080, cluster endpoint access: public

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/b5b77100-5a1c-4c45-8b65-137c576816fb)

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/e0f022f4-e068-43e2-9391-97a5042fd2b9)


##### For VPC CNI, CoreDNS and kube-proxy, choose the default versions, For CNI, latest and default are different. But go with default.

#### Click 'Create'. This process will take 10-12 minutes. Wait till your cluster shows up as Active. 


### _Step 2._ 

#### Add Node Groups to our cluster
======================================
#### Now, lets add the worker nodes where the pods can run.

#### Open the cluster > Compute > Add NodeGrp Name: eksnodegrp01

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/0e7f6539-2547-4c0f-b05f-534c7f6dcfd2)

#### Select the role you already created. Leave default values for everything else
#### >> AMI - choose the default 1 (Amazon Linux 2)
#### >> change desired/minimum/maximum to 1 (from 2)
#### >> Enable SSH access. Choose a security group which allwos 22, 80, 8080
#### >> Choose default values for other fields 

#### Node group creation may take 2-3 minutes.

### _Step 3._ 

#### Authenticate to this cluster
===================================

#### Reference: https://docs.aws.amazon.com/eks/latest/userguide/create-kubeconfig.html

#### Open cloudshell

#### Type on your AWS CLI window ; "aws sts get-caller-identity"

#### Observe your account and user id details.

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/9fb6f422-c6ef-40c4-8b4f-5e80944b874b)

#### Create a  kubeconfig file where it stores the credentials for EKS:

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/2c9e6b64-8169-47b4-a8d9-f2ca2bcc758a)

#### kubeconfig configuration allows you to connect to your cluster using the kubectl command line.

#### aws eks update-kubeconfig --region region-code --name my-cluster  // Use the cluster name you just created



#### see if you can get the nodes you created
#### kubectl get nodes

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/18749906-f88d-4a5a-b726-c12ac9cfea53)


### _Step 4._ 

#### Create a new POD in EKS for the 2048 game
================================================

#### create the config file in YAML to deploy 2048 game pod into the cluster
```` 
vi 2048-pod.yaml
````
````
### code starts ###

apiVersion: v1
kind: Pod
metadata:
   name: 2048-pod
   labels:
      app: 2048-ws
spec:
   containers:
   - name: 2048-container
     image: blackicebird/2048
     ports:
       - containerPort: 80

### code ends ###
````

#### apply the config file to create the pod

```` 
kubectl apply -f 2048-pod.yaml
````
#pod/2048-pod created

#### view the newly created pod

```` 
kubectl get pods
````
![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/124dbb8b-237c-4668-83d0-519b107149a2)


### _Step 5._

#### Setup Load Balancer Service
===================================
````
vi mygame-svc.yaml  
````

````
### code starts ###

apiVersion: v1
kind: Service
metadata:
   name: mygame-svc
spec:
   selector:
      app: 2048-ws
   ports:
   - protocol: TCP
     port: 80
     targetPort: 80
   type: LoadBalancer

### code ends ###
````

#### Apply the config file
````
kubectl apply -f mygame-svc.yaml
````
#### View details of the modified service
````
kubectl describe svc mygame-svc
````

#### Access the LoadBalancer Ingress on the kops instance
````
curl <LoadBalancer_Ingress>:<Port_number>
````

#### Go to EC2 console. get the DNS name of ELB and paste the DNS into address bar of the browser.

#### It will show the 2048 game. You can play.

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/3489d5ac-1c98-4805-b5b0-4428435e547c)


### _Step 6._ 

#### Cleanup
---------------

#### Clean up all the resources created in the task
````
kubectl get pods
kubectl delete -f 2048-pod.yaml
````

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/3b3a73bf-249f-40f2-ba22-f594c851039b)


````
kubectl get services
kubectl delete -f mygame-svc.yaml
````

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/1693d863-36e5-4127-ae22-ebe06860f5d8)

