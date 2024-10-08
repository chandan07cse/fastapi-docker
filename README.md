 # [Dockerized Fast API](https://github.com/chandan07cse/fastapi-docker) - Demo Application
 ### :feet: Local Installation
First install docker locally

https://docs.docker.com/engine/install/ubuntu/

Then cd into your project and run
```
sudo docker-compose -f docker-compose.dev.yml up -d --build --remove-orphans
```
Now go to http://localhost:8000 for your project

To check the available docker images , run
```
sudo docker ps -a
```

If you would like to ssh into images
```
sudo docker exec -it image-id sh
```
 ### :feet: Deployment
Push your code to github and it'll be automatically deployed to the server. 
Currently its configured for master branch only