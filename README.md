# web-deploy

#### [시작 전 Docker와 Shell 훑어보기](https://doong-jo.github.io/devops/2019/07/24/Docker-%EC%8B%9C%EC%9E%91%ED%95%98%EA%B8%B0-%EA%B7%B8%EB%A6%AC%EA%B3%A0-Shell%EC%9D%84-%EC%9D%B4%EC%9A%A9%ED%95%98%EC%97%AC-%EC%9E%90%EB%8F%99%ED%99%94-%ED%9D%89%EB%82%B4%EB%82%B4%EA%B8%B0/)

## Intro
웹 서비스 배포 시 이용할 수 있는 **배포 쉘 스크립트** 입니다.

- .gitignore 내용을 반영하여 배포 가능
- 서버 정보를 입력받아 전송 가능

## Usage


- .gitignore의 내용을 반영하여 배포 서버에 전송하고 싶다면 프로젝트 경로에 반드시 **".gitignore"** 파일이 존재해야 하며 "May I reflect your ".gitignore" file?" 프롬프트에서 **"yes"를 입력**합니다.

#### 예시
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

![screenshot_1](https://github.com/doong-jo/web-deploy/blob/master/screenshot_1.png?raw=true)
![screenshot_2](https://github.com/doong-jo/web-deploy/blob/master/screenshot_2.png?raw=true)
