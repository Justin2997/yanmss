# YANMSS (Yet Another New Mac Setup Script)

## About

This setup script is for modifying some default settings on Mac OS X, installing some of my preferred Terminal tools, and a few applications.

Please feel free to fork and/or add issues/PRs to help make this work better for everyone.

### Installation with Curl

To install this script from a brand new Mac (fresh out of the box!) run the following command in terminal:

``` shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/justin2997/yanmss/master/setup.sh)"
```

### Clean Up

Run the ``` brew ``` cleanup script and remove old or unneeded casks

``` shell
brew cleanup
```

### Post Script Actions

I have not yet figured out to automate the post script actions for some of these installations, so there are a few more steps to manually complete.

#### Enable Any Oh My Zsh Plugins

Oh My Zsh comes with a ton of plugins you can take advantage of. Here is the [wiki](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins) page.

Open your ``` ~/.zshrc ``` file via Terminal

``` shell
open ~/.zshrc
```

Find and edit the plugins section to add the ones you want

``` shell
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew ruby osx)
```

#### Set the Oh My Zsh Theme

Open your ``` ~/.zshrc ``` file via Terminal

``` shell
open ~/.zshrc
```

Modify the theme. You can find a list of the themes [here](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes.) I personally like the [agnoster](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#agnoster) theme.

``` shell
ZSH_THEME="agnoster"
```

Make sure to save and close the file after editing. You may have quit and reopen iTerm2 for the theme to take effect.

To make the Agnoster theme look the way it does on the wiki page you have to go to:

- Open iTerm2
- Select Preferences
- Click Profile
- Click Colors
- Change "Color Presets" to "Solarized Dark"
- While still in the same window as above, click "Text"
- Click on the dropdown under Font and select any font with "Powerline" in it. I chose "Meslo LG DZ for Powerline"

#### Enable FileVault
Follow this link : https://support.apple.com/en-ca/HT204837

#### Enable GPG key
Follow this link to install it : https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/generating-a-new-gpg-key

You can also run : 
```
gpg --quick-generate-key github@email.com
```
Follow the other stapes on Github website to add it there

#### Adding SSH key to Github
Follow this link to install it : https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

You can also run : 
```
ssh-keygen -t ed25519 -C "github@email.com"

eval "$(ssh-agent -s)"

open ~/.ssh/config
touch ~/.ssh/config
```

Change the file `config` name to : `id_ed25519` and add :
```
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
```

And run : 
```
ssh-add -K ~/.ssh/id_ed25519

pbcopy < ~/.ssh/id_ed25519.pub
```
Add the SSH key to your GitHub account.

#### Change git editor
If you like nano more than vim : 
```
git config --global core.editor "nano"
```
