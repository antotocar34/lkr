A cli tool that uses `age` and `rbw` to quickly encrypt and decrypt files and folders.


## TRY IT OUT
```
$ nix shell github:antotocar34/acpkgs#lkr
$ lkr generate-config
wrote to ~/.config/lkr/config.json

# Add key paths to ~/.config/lkr/config.json
$ mkdir test.private ; echo "huge secret" >> ./test.private/huge_secret
$ lkr lock test.private
$ ls
test.locked
$ lkr unlock test.locked
$ ls
test.private
$ cat test.private/huge_secret
huge secret
```
