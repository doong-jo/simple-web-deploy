# ubuntu

username="your_user_name"
password="your_password"
branch="your_branch_name"
project_dir="your_project_dir"

url="https://$username:$password@github.com/doong-jo/membership-todo.git"

cd $project_dir
git remote set-url origin $url
git fetch

find_origin="git rev-parse origin/$branch"
origin_hash=$($find_origin)

find_local=$(git rev-parse $branch)
local_hash=$find_local

if [ "$origin_hash" == "$local_hash" ]; then
        exit
fi

git pull $url

sudo npm install
sudo npm start
