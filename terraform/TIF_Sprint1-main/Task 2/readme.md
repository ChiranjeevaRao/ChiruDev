## Deploy Jenkins on EC2 with Terraform

***COMMANDS***

`````
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply --auto-approve
`````
![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/6ee24d9f-9ea9-4cb8-97db-e0932038f259)

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/432d1941-364f-4031-a7ba-5a7d7b51ac24)

### >> Also the keypairs (Public & Private) is generating through terraform. Public key is getting attched to the instance and Private Key is stored in my root folder.

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/0cacf23e-91ab-42f7-bde7-7948188808db)

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/64c3f0ca-dad9-4d5b-bf25-3b5d84b1eeb9)


### >> As defined in output.tf file you will get to know the website URL for jenkins.

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/89f1948a-d683-48b4-9036-bfb930204c95)

### >> Jenkins get installed on the ec2 automatically as install_jenkins.sh file runs as user data.

### >> Copy the website url and put it in the browser to access the Jenkins Homepage.

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/dadc2784-c0ae-4a1c-80a7-fea66de42a6b)

### >> Connect the EC2 Server to find the password and Unlock Jenkins.

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/b20072b0-7e6e-4e31-a212-506ccad183f6)

### >> Installation of suggested plugins get started.

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/7ab23a14-3d1f-44a8-a512-7bcc0625723b)





