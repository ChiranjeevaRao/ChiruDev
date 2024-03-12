## >> Configure and Install all required plugins and Github, AWS Integration.

### >> After login successfully to Jenkins homepage now we will install the suggested Plugins.

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/ef05e99c-13f9-42a9-ac15-f2fde6ea1b2e)

### >> After installation of the suggested plugins, now we create user for further process.

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/ea11f807-fb59-48fc-a8e2-935c20a94cee)

### >> Jenkins gets ready to use.

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/c4088cba-1e78-4855-9e3b-ac09b6d9f665)

### >>> Install some plugins for Aws, Job Import, Backup and Role-Based Strategy.

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/da4579eb-1bed-4a19-92a5-fe266a6af8e0)


![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/dd78ba86-6099-495b-9a33-6a3d15f8b636)
![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/59db1c26-8403-4722-b233-5e39df9884d4)



### >>> Also go to Jenkins’ own user database create some users.

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/0fd66876-ba72-4da8-8d0c-a39819f9504d)


### >>> Now go to manage jenkins then to Security and under authorization select "Role Based strategy" and save.

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/2c387f28-c7d5-47a2-b282-b716cee28853)


### >>> Go to >> Dashboard >> Manage Jenkins >> Manage and Assign Roles >> Manage Roles

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/7bf7cb69-7c03-489f-b8a6-506c6b76b043)

### >>> Under "Manage Roles" section add some roles to define and then SAVE.

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/fc993a7f-ee1d-4e2d-9b78-214e7b80eb86)

### >>> Go to >> Dashboard >> Manage Jenkins >> Manage and Assign Roles >> Assign Roles and Assign roles to users, Save and apply.

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/ea6f076d-8c44-4edf-b5d3-ad66ae25b51c)

### >>> Like this we can assign roles to different users for different permissions.

======================================================================================================================

### >>> Now we will try to run a dummy maven project job on Jenkins. for that we have to install "maven integrations" plugins.

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/07dc3107-5125-4fc8-95fe-58c321c334c4)

### >>> We will create a maven project job.

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/13b323b8-9ded-418f-aeff-265c8e2d4000)

### >>> We will provide the Project git url.

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/6599e01c-cb85-4ced-9386-10fc8222a512)

### >>> Go to >> Dashboard >> Manage Jenkins >> Tools and configure Java_Home & Maven_Home

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/845780cb-9085-4832-bd15-80da5cf31c0a)

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/f7515f37-a951-4111-a6fb-cbd77d17f2d0)

### >>> Under build section , we will configure maven then apply & save.

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/241eb889-5157-42eb-978e-de9560fce00b)

### >>> Execute to build now the maven job.

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/dd411c88-fa0b-4fd8-902d-30304a262850)

### >>> The Job completed succefully.

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/3e67b17b-5682-47e4-b51a-f0efe8c8cfa8)

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/b78b9645-216f-45d7-87d2-ea080a8ab2db)

![image](https://github.com/howdycloudyarsh/TIF_Sprint1/assets/133496386/d6f82718-e1ab-4c13-996a-af87d4d86a3c)











