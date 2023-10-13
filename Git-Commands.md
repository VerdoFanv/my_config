# Git Commands

## login
- ```git config --global user.name 'your name'```
- ```git config --global user.email 'you@example.com'```

## branch
- ```git branch```
- ```git branch -d <localBranchName>```
- ```git checkout -b <branch name>```
- ```git push origin --delete <remoteBranchName>```
- ```git merge <branch name>```
- ```git pull origin <branch name>```
- ```git push origin <branch name>```

## stashing
- ```git stash```
- ```git stash apply```
- ```git stash list```

## log
- ```git log```
- ```git log --graph```
- ```git blame [file]```

## init
- ```git init```
- ```git add .```
- ```git commit -m 'your commit'```

## tags
- ```git tag <tag name>```
- ```git push --tags```

## remote
- ```git remote add origin <remote repo url>```
- ```git remote -v```
- ```git remote rm <remote name>```
- ```git remote set-url origin https://<git-username>:<git-user-token>@github.com/<git-username>/<git-repo-name>.git```
- ```git remote remove <remote name>```

## clone
- ```git clone <remote repo url>```
- ```git clone --branch <branchname> https://<git_username>:<git_token>@github.com/<git_username>/<git_repo>.git```
- ```git clone --branch <branchname> https://<git_username>:<git_token>@github.com/<git_username>/<git_repo>.git .```