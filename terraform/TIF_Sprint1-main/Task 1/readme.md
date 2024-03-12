## Create Jenkins Manually on EC2 Instance [Ec2 should be deployed using Terraform]

***Step 1.*** 
   ### Provisioned an EC2 instance with amazon linux server through terraform scripts.
![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/facd9340-102f-46d7-a13e-aef0d2e5a1f7)

***Step 2.***
   ### Enable the tcp ports number 22 and 8080 for ssh and jenkins.
![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/fd2c7c14-7ae6-4aba-8942-52f50a67e5ce)

***Step 3.***
   ### Created a file called install_jenkins.sh and written jenkins installation commands.
![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/c7199a76-cfc5-4743-9560-b00826f6c35f)

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/2847ce89-c39e-4e72-acb1-c227a1e4d1e2)

***Step 4.***
   ### Given executable permission to this shell file.
![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/828cbb67-d2ea-4db4-a804-7a622fb71fa1)

***Step 5.***
   ###   Executed this shell script and wait for the Java and Jenkins Installtion on the server.
![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/3cb135dc-089e-4dad-8802-0b15dd23ccef)

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/0dcdbaa9-418b-471c-812a-0db1acd4cf03)


***Step 6.***
   ### Copy the public ip of the server and put it in the browser with :8080 to acess Jenkins Webpage.
![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/eab0497d-a238-4cbc-9e48-a49114722f65)

***Step 7.***
   ### Accessed the Administrator password and login into it.
  ![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/fbb6c42b-0ffc-4c3f-a1d6-231ced72cacc)

  ![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/7f46689a-fbd3-410c-b8fa-84b06d1cd2d5)

