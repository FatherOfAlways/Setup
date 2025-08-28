## Winget

### Resources

- [winstall.app](https://winstall.app/) - Package Search
- [winget.run](https://winget.run/) - Alternative package Search
- [Documentation](https://learn.microsoft.com/en-us/windows/package-manager/winget/)


### Usage

Check for outdated packages:

```
winget update
```

Update all packages (confirming all prompts):

```
winget upgrade --all --accept-package-agreements --accept-source-agreements
```

List all installed packages:

```
winget list
```


### Export

Export a list of all installed packages to install on another machine:

```
winget export -o packages.json
```



## Chocolatey

### Resources

- [community.chocolatey.org](https://community.chocolatey.org/packages) - Package Search
- [Documentation](https://docs.chocolatey.org/en-us/choco/)
- [Installation](https://chocolatey.org/install)


### Usage

Check for outdated packages:

```
choco outdated
```

Update all packages (confirming all prompts):

```
sudo choco upgrade all --acceptlicense
```

*Note: needs [`gsudo`](https://github.com/gerardog/gsudo) to work. If not installed, open elevated Terminal and run from there.*

List all installed packages:

```
sudo choco list
```


### Export

Export a list of all installed packages to install on another machine:

```
sudo choco export "'\PATH\TO\FILE.config'"
```
