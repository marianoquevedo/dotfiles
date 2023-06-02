# dotfiles
A collection of my dotfiles

## Run install.sh

```
sh ./install.sh
```

## Install utilities

- `brew bundle`
- Install [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh#basic-installation) 
- Install [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh)

## Install fzf (avoid brew so we can have shortcuts installed)

```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

## Install Node
https://github.com/creationix/nvm#installation

`nvm install 18 && nvm alias default 18 && nvm use default`

`npm login`

## Git

```shell
cp .gitignore ~/ 
```

### iTerm theme

[Dracula theme](https://draculatheme.com/iterm) + `Cascadia Code Font`

Previous used themes:

- [snazzy](https://github.com/sindresorhus/iterm2-snazzy)

### uBlock
[Anti-Paywall](https://raw.githubusercontent.com/liamengland1/miscfilters/master/antipaywall.txt)

## Reference
- https://sourabhbajaj.com/mac-setup
- https://github.com/cilindrox/dotfiles
- https://ohmyz.sh/
- https://github.com/marianoquevedo/automantic-dotfiles/blob/master/install.sh
