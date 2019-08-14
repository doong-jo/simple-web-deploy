#!/bin/bash

echo "-----START DEPLOY-----"

# root_path 입력
read -p "Give me your project root path (current path : "./") > " root_path

# .gitignore를 반영할건지 입력 (없다면 Enter, 모두 전송)
read -p "May I reflect your \".gitignore\" file? (yes/no) > " is_ignored

# 배포 서버 포트, user_name, host, 경로
read -p "Input your server port > " server_port
read -p "Input your server user name > " server_user_name
read -p "Input your server host > " server_host
read -p "Input your server path > " server_path

START_PATH=$(pwd)

today=$(date +%Y%m%d)
ZIP_DIR=$root_path/../deploy_$today
mkdir $ZIP_DIR

function copy_all() {
    rsync -rq $root_path/. $ZIP_DIR
    rsync -rq $root_path/* $ZIP_DIR
}

# find all file and directory in root_path then exclude .gitignore
# use "https://unix.stackexchange.com/a/358280", "https://git-scm.com/docs/git-check-ignore"
function copy_reflect_ignore() {
    copy_all

    cd $ZIP_DIR

    # remove ignore files
    find . -not -path './node_modules*' \
        -a -not -path '*.git*'               \
        -a -not -path './coverage*'          \
        -a -not -path './bower_components*'  \
        -a -not -name '*~'                   \
        -exec sh -c '
        for f do
            if [ "$(git status -s $f)" == "" ]; then
                rm -rf "$f"
            fi
        done
       ' find-sh {} +
    
    cd $START_PATH
}

if [ "$is_ignored" = "yes" ]; then
    copy_reflect_ignore
else
    copy_all
fi

cd $root_path/../
zip $ZIP_DIR.zip -qr ./deploy_$today

scp -P $server_port -r $ZIP_DIR.zip "$server_user_name@$server_host:$server_path"

rm -rf $ZIP_DIR
rm $ZIP_DIR.zip

cd $START_PATH

echo "-----FINISH DEPLOY-----"