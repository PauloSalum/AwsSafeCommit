## AWS Safe Commit

Prevent your AWS keys from being exposed accidentally

Comand:

```sh
bash <(curl -s https://raw.githubusercontent.com/PauloSalum/AwsSafeCommit/master/AwsSafe.sh)
```

What it will do?

- Create a global Hook folder
- Add a pre-commit hook to prevent commit an aws security key
- Automatically updates all your git projects to use the new hook

Refs:

> https://gist.github.com/PauloSalum/47330177a5480aafd8bd76109d656fc4 > https://gist.github.com/ColCh/9d48693276aac50cac37a9fce23f9bda > https://gist.github.com/czardoz/b8bb58ad10f4063209bd
