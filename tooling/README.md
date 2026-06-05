# homelab-configurations

Various configuraions for various tools used to build out my homelab

*.thegriffinshome.com

## Add ssh key to machine

- https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
- https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account

1. Generate ssh key on machine
   ```bash
   ssh-keygen -t ed25519 -f ~/.ssh/machine-<MACHINE_NAME> -C "alecgriffin.dev@gmail.com"
   ```

2. Start SSH Server
   ```
   eval "$(ssh-agent -s)"
   ``` 

3. Add private SSH keys to the SSH authentication agent (or else SSH agent won't use keys with custom names)
   ```bash
   ssh-add ~/.ssh/machine-<MACHINE_NAME>
   ```

## Setup Docker


## Accessing Tools


