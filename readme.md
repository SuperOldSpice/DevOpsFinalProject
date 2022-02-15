# DevOps Final Project 
***Dmytro Kubai***

***

<img src="screenshots/jenkins_logo.png" alt="drawing" width="200"/>

### Multibranch CI/CD pipeline 

Project uses 
- Amazon Web Services for running tools and web server hosting
- GitHub as application source repository
- DockerHub as image storage
- Jenkins as CI/CD tool
- Docker for packaging, delivering and running application

***
<br>

### Problem
Developers team works on the web server application. It tries to implement new features as soon as possible and client wants to review them. The latest version of application must be regulary uploaded to server  

<img src="screenshots/dev.png" alt="drawing" width="200"/>

Developers work in their own environments and push code to github repository. But changes can lead to instability and every edit requires the app to be rebuild
<br><br>

### Solution 
Creating multibranch pipeline can make developing process much more efficient. Code will be automatically pulled from the repository, tested and builded in the defined environment    

<img src="screenshots/solution.png" alt="drawing" width="200"/>

Application container image will pe pushed to Dockerhub and deployed to the production server
<br><br>

### Pipeline stages 
<img src="screenshots/PipelineDiagram.drawio.png" alt="drawing" width="500"/>
<br><br>

### Pipeline overview
<img src="screenshots/blueocean.png" alt="drawing" width="800"/>

Pipeline steps overview in blueocean
<br><br>

### Dockerhub
<img src="screenshots/dockerhub.png" alt="drawing" width="600"/>

Images with different versions of web app are stored into dockerhub repository
<br><br>

### AWS instances
<img src="screenshots/servers.png" alt="drawing" width="700"/>

All tool were run by AWS 
<br><br>

### Web server
<img src="screenshots/host.png" alt="drawing" width="700"/>

Container running on the deploy server. To verify that pipeline works correctly It displayes the build number
<br><br>