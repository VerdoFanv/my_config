## SETUP TABBY MACOS
```
brew install --cask tabby
mkdir -p ~/.ssh/sockets && chmod 700 ~/.ssh ~/.ssh/sockets

nano ~/.ssh/config
Host *
    AddKeysToAgent yes
    UseKeychain yes
    ControlMaster auto
    ControlPath ~/.ssh/sockets/%r@%h-%p
    ControlPersist 10m
    ServerAliveInterval 30
    ServerAliveCountMax 3

ssh-add -l
ssh -v -S none user@ip-server exit 2>&1 | grep -E "Offering public key|Authenticated to"
ssh-add --apple-use-keychain ~/.ssh/ssh_file
echo 'ssh-add --apple-load-keychain ~/.ssh/ssh_file 2>/dev/null' >> ~/.zshrc
source ~/.zshrc && ssh-add -l
```
