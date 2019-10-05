# web-deploy

## Intro
You can refer to or use it when you deploy web services. 🙆‍♂️

## Feature 1 - Deploy with Docker
### Depoly your web server in local

#### 1. [Install Docker](https://docs.docker.com/install/)

#### 2. Write Dockerfile

```bash
# make 'Dockerfile' (no extension)
# after 'docker pull ubuntu'
FROM ubuntu

LABEL maintainer="Sungdong Jo <josungdong@naver.com>"

RUN apt-get update && apt-get install -y curl
# use node v10 LTS
RUN curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt-get install -y nodejs && apt-get install -y build-essential
# use redis
RUN apt-get install -y redis-server

RUN mkdir -p /app
# SET WORKDIR
WORKDIR /app
ADD . /app
RUN npm install

ENV NODE_ENV production

EXPOSE 6379 80

CMD ["npm", "start"]
```

#### 3. Deploy youer web server
-  same path with 'Dockerfile'
```bash
# install
docker build -t membership/web-app .

# run
docker run --name todo_app -p 49160:80 -d membership/web-app

# log
docker ps
docker logs <container id>
```

**You can connect to [localhost:49160](localhost:49160)**

## Feature 2 - Basic Shell Script

- reflect with .gitignore
- include your server host

#### example
View [web-deploy.sh](https://github.com/doong-jo/web-deploy/blob/master/use-shell/web-deploy.sh)

```bash
# execute script
sh web-deploy.sh
```

```
-----START DEPLOY-----
Give me your project path (current path : ./) > "~/my_web_service"
May I reflect your ".gitignore" file? (yes/no) > "yes or no"
Input your server port > "22"
Input your server user name > "doong-jo"
Input your server host > "127.0.0.1"
Input your server path > "~/"
```

![screenshot_1](https://github.com/doong-jo/web-deploy/blob/master/use-shell/screenshot_1.png?raw=true)
![screenshot_2](https://github.com/doong-jo/web-deploy/blob/master/use-shell/screenshot_2.png?raw=true)
