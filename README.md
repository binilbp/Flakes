# Flakes
Nix Flakes Repository

## Usage
Commands are to be executed from the same dir of Nix flake 
### devShells 

For Activating dev shell with user shell and config  (here zsh):

```bash
nix develop --command zsh -i
```

For Activating dev shell with the default bash shell:

```bash
nix develop 
```
**Interactive Shell Activation**<br>
execute `devshell_choice.sh` script to get an interactive shell activation.(NOTE: this command uses zsh, remove "--command zsh -i"  from the script if you dont want zsh.

```bash
# grant execution permission for the scipt
chmod +x ./devshell_choice.sh
```


```bash
# execute the scipt 
./devshell_choice.sh
```






