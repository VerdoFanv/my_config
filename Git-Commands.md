# Git Commands

## login
- ```git config --global user.name 'your name'```
- ```git config --global user.email 'you@example.com'```

## branch
- ```git branch```
- ```git branch -d <localBranchName>```
- ```git checkout -b <branch name>```
- ```git push origin --delete <remoteBranchName>```

## init
- ```git init```
- ```git add .```
- ```git commit -m 'your commit'```

## remote
- ```git remote add origin <remote repo url>```
- ```git remote -v```
- ```git remote rm <remote name>```
- ```git remote set-url origin https://<git-username>:<git-user-token>@github.com/<git-username>/<git-repo-name>.git```

## update, clone and upload
- ```git push origin master```
- ```git clone <remote repo url>```
- ```git clone https://<git_username>:<git_token>@github.com/<git_username>/<git_repo>.git```
- ```git clone https://<git_username>:<git_token>@github.com/<git_username>/<git_repo>.git .```
- ```git pull origin master```
- ```git pull```