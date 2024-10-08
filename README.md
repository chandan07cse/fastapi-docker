# Local Installation :
First install docker locally

https://docs.docker.com/engine/install/ubuntu/

Then cd into your project and run
```
sudo docker-compose -f docker-compose.dev.yml up -d --build --remove-orphans
```
Now go to http://localhost:88 for your project

To check the available docker images , run
```
sudo docker ps -a
```

If you would like to ssh into images
```
sudo docker exec -it image-id sh
```

If you would like to run migrations
```
rails db:migrate RAILS_ENV=development
```

If you would like to run the migration outside of the container
```
sudo docker exec billing-system-backend_app_1 rails db:migrate
```

Also if you wanna remove stale containers, run
```
sudo docker container prune
```

Database Credentials:
```  
  DATABASE_USERNAME: "postgres"
  DATABASE_PASSWORD: "password"
  DATABASE_HOST: "postgres"
  DATABASE_NAME: "app_development"
  DATABASE_PORT: "5433"
```

You can connect your dockerized postgres database from pgadmin or dbeaver or from local terminal.
To connect from local terminal, 
```
sudo docker exec -it postgres-container-id sh 
```

Now inside postgres container, run
```
psql -U postgres
```
To show databases
```
\l
```
To use app_development database
```
use app_development
```
To restore your db
```
cat mip_db.sql | sudo docker exec -i 7d73898a7031 pg_restore -U postgres -d app_development
```