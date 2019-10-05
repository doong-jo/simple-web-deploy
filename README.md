# web-deploy

## Intro
웹 서비스 배포 시 참고하거나 사용할 수 있습니다. 🙆‍♂️

## Feature 1 - Deploy with Docker
### Docker를 통해 로컬에서 웹서버 배포해보기

#### 1. [Docker 설치](https://docs.docker.com/install/)하기

#### 2. Dockerfile 만들기

```bash
# 'Dockerfile' 생성 (확장자 없음)
# docker pull ubuntu 명령 후
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
# WORKDIR 로 설정
WORKDIR /app
# /app 에 복사
ADD . /app
# npm install 을 실행
RUN npm install

ENV NODE_ENV production

EXPOSE 6379 80

CMD ["npm", "start"]
```

#### 3. 웹서버 배포
-   'Dockerfile'과 같은 경로에서 아래의 명령을 실행
```bash
# install
docker build -t membership/web-app .

# run
docker run --name todo_app -p 49160:80 -d membership/web-app

# log
docker ps
docker logs <container id>
```

**이후 [localhost:49160](localhost:49160) 으로 접속할 수 있다.**

## Feature 2 - Basic Shell Script

- .gitignore 내용을 반영하여 배포 가능
- 서버 정보를 입력받아 전송 가능
- .gitignore의 내용을 반영하여 배포 서버에 전송하고 싶다면 프로젝트 경로에 반드시 **".gitignore"** 파일이 존재해야 하며 "May I reflect your ".gitignore" file?" 프롬프트에서 **"yes"를 입력**합니다.

#### 예시
View [web-deploy.sh](https://github.com/doong-jo/web-deploy/blob/master/use-shell/web-deploy.sh)

```bash
# 실행
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
