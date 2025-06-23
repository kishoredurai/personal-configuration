
## Plugins :

---

- install (==syntax-highlighting==) using below code:

```bash
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
```

--  or  --

```bash
brew install zsh-syntax-highlighting
```


- Install (==zsh-autosuggestions== ) using below code:

```bash
brew install zsh-autosuggestions
```


- after installing source to activate it


```shell
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
```

-- o r --

- Clone this repository into `$ZSH_CUSTOM/plugins` (by default `~/.oh-my-zsh/custom/plugins`)
```shell
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    ```

- Add the plugin to the list of plugins for Oh My Zsh to load (inside `~/.zshrc`):
```shell
plugins=( 
    # other plugins...
    zsh-autosuggestions
)
```


## Spaceship theme :

---

- Install spaceship theme using oh my zsh
```shell
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
```

- Symlink `spaceship.zsh-theme` to your oh-my-zsh custom themes directory:

```shell
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
```

- Set `ZSH_THEME="spaceship"` in your `.zshrc`.
- Prompt color code change (ref: https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg)

---
 ==Reference== : 
- https://github.com/kishoredurai/configuration ( ==configuration file== )
 - https://github.com/spaceship-prompt/spaceship-prompt?tab=readme-ov-file
 - https://github.com/pascaldevink/spaceship-zsh-theme
 - https://spaceship-prompt.sh/sections/

---
