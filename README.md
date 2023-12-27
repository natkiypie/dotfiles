# natkiypie's dotfiles

> We were always alone, never lonely.

## Table of Contents (Steps to Reproduce in Sequential Order)

- [Required Packages](https://github.com/natkiypie/dotfiles#required-packages)
- [Optional Packages](https://github.com/natkiypie/dotfiles#optional-packages)
- [Vim](https://github.com/natkiypie/dotfiles#vim)
- [Pass](https://github.com/natkiypie/dotfiles#pass)
- [Git](https://github.com/natkiypie/dotfiles#git)
- [Github CLI](https://github.com/natkiypie/dotfiles#github-cli)
- [Node Version Manager](https://github.com/natkiypie/dotfiles#node-version-manager)
- [Node Global Packages](https://github.com/natkiypie/dotfiles#node-global-packages)
- [Dot Files](https://github.com/natkiypie/dotfiles#dot-files)
- [Neovim](https://github.com/natkiypie/dotfiles#neovim)
- [i3](https://github.com/natkiypie/dotfiles#i3)
- [Other Useful Settings](https://github.com/natkiypie/dotfiles#other-useful-settings)

## Required Packages

#### Installation

1. Install packages:

```
sudo apt install build-essential compton curl feh gpg lm-sensors ninja-build python3-pip stow
```

<details><summary><b>Package Information</b></summary>
<p>

- `build-essential` - required by [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter#requirements)

  > Meta-packages that are necessary for compiling software.

- `compton` - required in [i3 config](/.config/i3/config)

  > A compositor for X11.

- `curl` - required in step 1 of [Github CLI](https://github.com/natkiypie/dotfiles#github-cli) & step 1 of [Node Version Manager](https://github.com/natkiypie/dotfiles#node-version-manager)

  > A tool to transfer data from or to a server.

- `feh` - required by [set_background_img.sh](/.scripts/initialization/set_background_img.sh)

  > Image viewer and cataloguer.

- `gpg` - required in step 2 of [Pass](https://github.com/natkiypie/dotfiles#pass)

  > Image viewer and cataloguer.

- `lm-sensors` - required by [run_diagnostics.sh](/.scripts/initialization/run_diagnostics.sh)

  > Show the current readings of all sensor chips.

- `ninja-build` - required by [sumneko lua-language-server](https://github.com/sumneko/lua-language-server/wiki/Build-and-Run)

  > A small build system with a focus on speed.

- `python3-pip` - required by nvim's [provider-python](https://neovim.io/doc/user/provider.html)

  > A tool for installing and managing Python3 packages

- `stow` - required in step 3 of [Dot Files](https://github.com/natkiypie/dotfiles#dot-files)

  > Manage farms of symbolic links.

</p>
</details>

## Optional Packages

#### Installation

1. Install packages:

```
sudo apt install apt-transport-https devtodo fonts-firacode gnome-screenshot htop lightdm-gtk-greeter-settings powertop tlp
```

<details><summary><b>Package Information</b></summary>
<p>

- `apt-transport-https`

  > APT transport for downloading via the HTTP Secure protocol (HTTPS).

- `devtodo`

  > A reminder / task program aimed at developers.

- `fonts-firacode`

  > An extension of the Fira Mono font containing a set of ligatures for common programming multi-character combinations.

- `gnome-screenshot`

  > Capture the screen, a window, or an user-defined area and save the snapshot image to a file.

- `htop`

  > An interactive process viewer.

- `lightdm-gtk-greeter-settings`

  > Settings editor for LightDM GTK+ Greeter

- `powertop`

  > A power consumption and power management diagnosis tool.

- `tlp`

  > Apply laptop power saving settings.

</p>
</details>

## Vim

> Vi IMproved, a programmer's text editor.

- https://www.vim.org/
- https://github.com/vim/vim

#### Installation & Setup

1. Install vim:

```
sudo apt install vim
```

2. Update default editor:

```
sudo update-alternatives --config editor
```

3. Make Selection:

```
  Selection    Path                Priority   Status
------------------------------------------------------------
  0            /bin/nano            40        auto mode
  1            /bin/ed             -100       manual mode
  2            /bin/nano            40        manual mode
* 3            /usr/bin/vim.basic   30        manual mode
  4            /usr/bin/vim.tiny    15        manual mode

Press <enter> to keep the current choice[*], or type selection number: 3
```

## Pass

> Lightweight directory-based password manager. Stores, retrieves, generates, and synchronizes passwords securely using gpg and git.

- https://www.passwordstore.org/

#### Installation & Setup

1. Install pass:

```
sudo apt install pass
```

2. If a gpg key & password store have already been generated, skip to [this](https://github.com/natkiypie/dotfiles#copy-private-key-trust-database--password-store-to-other-trusted-machines) step. Otherwise, generate a new gpg key: https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key

3. List secret keys:

```
gpg --list-secret-keys --keyid-format=long
```

4. Get key ID from output - in this example, the key ID is **3AA5C34371567BD2**:

```
/Users/hubot/.gnupg/secring.gpg
------------------------------------
sec   4096R/3AA5C34371567BD2 2016-03-10 [expires: 2017-03-10]
uid                          Hubot
ssb   4096R/42B317FD4BA89E7A 2016-03-10
```

5. Initialize the password store - the password storage key in this example is the key ID from the previous step:

```
pass init 3AA5C34371567BD2
```

#### Copy Private Key, Trust Database & Password Store to Other Trusted Machines

1. List keys:

```
gpg --list-keys
```

2. Get key ID from output - in this example, the key ID is **KLVP1DFUW09SK6XB2CDA84BX3AA5C34371567BD2**:

```
/Users/hubot/.gnupg/pubring.gpg
------------------------------------
pub   4096R 2016-03-10 [expires: 2017-03-10]
      KLVP1DFUW09SK6XB2CDA84BX3AA5C34371567BD2
uid         Hubot
ssb   4096R 2016-03-10
```

3. Export secret key - the secret key in this example is the key ID from the previous step:

```
gpg --export-secret-key KLVP1DFUW09SK6XB2CDA84BX3AA5C34371567BD2 > secret.key
```

4. Export trust database:

```
gpg --export-ownertrust > trust.txt
```

5. Copy password store:

```
cp -r ~/.password-store password-store
```

6. Transport `secret.key` `trust.txt` & `password-store` to new machine

7. Rename password store, import trust db & import secret key - you will be prompted to enter the passphrase used when first generating your gpg key:

```
mv password-store .password-store; gpg --import-ownertrust < trust.txt; gpg --import secret.key
```

8. Remove secret key and trust database files

```
rm secret.key trust.txt
```

#### Update Master Password:

1. In the case that a password store was imported and the user password has changed, update the master password:

```
pass edit master/$USER
```

2. If a new password store was created, the user password can be added to the password store using the same method:

```
pass edit master/$USER
```

## Git

> Git is a fast, scalable, distributed revision control system with an unusually rich command set that provides both high-level operations and full access to internals.

- https://git-scm.com/
- https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup

#### Installation & Setup

1. Install git:

```
sudo apt install git
```

2. Set user name and email address:

```
git config --global user.name "Max Demian"; git config --global user.email maxdemian@example.com
```

3. Configure default editor:

```
git config --global core.editor vim
```

4. Set default initial branch:

```
git config --global init.defaultBranch main
```

5. Check settings:

```
git config --list
```

## Github CLI

> GitHub CLI is an open source tool for using GitHub from your computer's ~~command line~~ terminal. When you're working from the ~~command line~~ terminal, you can use the GitHub CLI to save time and avoid switching context.

- https://docs.github.com/en/github-cli/github-cli/quickstart
- https://github.com/cli/cli/blob/trunk/docs/install_linux.md#official-sources

#### Installation & Setup

1. Install gh:

```
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg; echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null; sudo apt update; sudo apt install gh
```

2. Authenticate to github

```
gh auth login
```

## Node Version Manager

> Nvm allows you to quickly install and use different versions of node via the ~~command line~~ terminal.

- https://github.com/nvm-sh/nvm

#### Installation & Setup

1. Run latest nvm install script found here: https://github.com/nvm-sh/nvm#install--update-script

2. Refresh the current shell environment:

```
source ~/.bashrc
```

3. Verify install - will output `nvm` on success:

```
command -v nvm
```

4. Download, compile & install latest release of node:

```
nvm install node
```

## Node Global Packages

> Installing a package globally allows you to use the code in the package as a set of tools on your local computer.

- https://www.npmjs.com/
- https://github.com/npm/cli

#### Installation

1. Install packages globally:

```
npm install -g @fsouza/prettierd commitizen cz-conventional-changelog eslint eslint_d neovim npm-check-updates tree-sitter tree-sitter-cli ts-node typescript typescript-language-server vscode-langservers-extracted
```

<details><summary><b>Package Information</b></summary>
<p>

- `@fsouza/prettierd` - https://www.npmjs.com/package/@fsouza/prettierd
  > Wanna run prettier in your editor, but fast? Welcome to prettierd.
- `commitizen` - https://www.npmjs.com/package/@fsouza/prettierd
  > When you commit with Commitizen, you'll be prompted to fill out any required commit fields at commit time.
- `cz-conventional-changelog` - https://www.npmjs.com/package/cz-conventional-changelog
  > Part of the commitizen family. Prompts for conventional changelog standard.
- `eslint` - https://www.npmjs.com/package/eslint
  > A pluggable JavaScript linter.
- `eslint_d` - https://www.npmjs.com/package/eslint_d
  > Makes eslint the fastest linter on the planet.
- `neovim` - https://www.npmjs.com/package/neovim
  > A neovim node-client.
- `npm-check-updates` - https://www.npmjs.com/package/npm-check-updates
  > npm-check-updates upgrades your package.json dependencies to the latest versions, ignoring specified versions.
- `tree-sitter` • `tree-sitter-cli` - https://www.npmjs.com/package/tree-sitter
  > Incremental parsers for node.
- `ts-node` - https://www.npmjs.com/package/ts-node
  > TypeScript execution and REPL for node.js, with source map and native ESM support.
- `typescript` - https://www.npmjs.com/package/typescript
  > A TypeScript node-client.
- `typescript-language-server` - https://www.npmjs.com/package/typescript-language-server
  > Language Server Protocol implementation for TypeScript wrapping tsserver.
- `vscode-langservers-extracted` - https://www.npmjs.com/package/vscode-langservers-extracted
  > HTML/CSS/JSON language servers extracted from vscode.

</p>
</details>

### Delta

> A syntax-highlighting pager for git, diff, and grep output.

- https://github.com/dandavison/delta
- https://github.com/jesseduffield/lazygit/blob/master/docs/Custom_Pagers.md

#### Installation & Setup

1. Download archive file `git-delta_x.xx.x_amd64.deb` found here: https://github.com/dandavison/delta/releases

2. Install deb file, clear additional files & store executable in location for non-operating system programs:

```
sudo dpkg -i git-delta_x.xx.x_amd64.deb; rm *.deb; mv /usr/bin/delta /usr/local/bin/
```

3. Add delta configuration to `~/.gitconfig` or `~/.config/git/config`:

```gitconfig
[core]
    pager = delta

[interactive]
    diffFilter = delta --color-only

[delta]
    navigate = true

[merge]
    conflictstyle = diff3

[diff]
    colorMoved = default
```

### StyLua

> An opinionated code formatter for Lua 5.1, Lua 5.2 and [Luau](https://roblox.github.io/luau/), built using [full-moon](https://github.com/Kampfkarren/full-moon). StyLua is inspired by the likes of [prettier](https://github.com/prettier/prettier), it parses your Lua codebase, and prints it back out from scratch, enforcing a consistent code style.

- https://github.com/johnnyMorganz/StyLua
- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#stylua

#### Installation & Setup

1. Download zip file `stylua-x.xx.x-linux.zip` found here: https://github.com/johnnyMorganz/StyLua/releases

2. Unzip compressed files, clear additional files, change file mode to executable for all users & store in location for non-operating system programs:

```
unzip stylua-x.xx.x-linux.zip; rm *.zip; chmod a+x stylua; sudo mv stylua /usr/local/bin/
```

## Dot Files

> User-specific application configuration is traditionally stored in so called dotfiles (files whose filename starts with a dot).

- https://github.com/natkiypie/dotfiles
- https://alexpearce.me/2016/02/managing-dotfiles-with-stow/

#### Installation & Setup

1. Clone repository:

```
git clone https://github.com/natkiypie/dotfiles.git
```

2. Remove conflicting files:

```
rm -rf $HOME/.bashrc $HOME/.bash_aliases $HOME/.config/broot
```

3. Mirror home directory structure, create symbolic links from dotfiles & refesh shell environment:

```
mv dotfiles $USER; mkdir $HOME/.dotfiles; mv $USER $HOME/.dotfiles; cd $HOME/.dotfiles; stow $USER; source ~/.bashrc
```

## Neovim

> Hyperextensible Vim-based text editor.

- https://neovim.io/
- https://github.com/neovim/neovim
- https://launchpad.net/~neovim-ppa/+archive/ubuntu/unstable

#### Installation & Setup

1. Install neovim nightly:

```
sudo add-apt-repository ppa:neovim-ppa/unstable; sudo apt update; sudo apt install neovim
```

2. Add nvim as vim alternative:

```
sudo update-alternatives --install $(which vim) vim $(which nvim) 10
```

3. Update vim alternatives:

```
sudo update-alternatives --config vim
```

4. Make selection:

```
  Selection    Path                Priority   Status
------------------------------------------------------------
  0            /usr/bin/vim.basic   30        auto mode
* 1            /usr/bin/nvim        10        manual mode
  2            /usr/bin/vim.basic   30        manual mode

Press <enter> to keep the current choice[*], or type selection number: 1

```

#### Running Nvim For The First Time

1. Update & compile plugins:

```
:PackerSync
```

2. Install language servers:

```
:LspInstall tsserver cssls html
```

3. Check health:

```
:checkhealth
```

## i3

> i3 is a tiling window manager, completely written from scratch. The target platforms are GNU/Linux and BSD operating systems, our code is Free and Open Source Software (FOSS) under the BSD license.

- https://i3wm.org/
- https://feeblenerd.blogspot.com/2015/11/pretty-i3-with-xfce.html
- https://github.com/Airblader/i3/wiki/installation#ubuntu

#### Set Background Image

1. Store image with architecture-independent data & set with script:

```
sudo cp -r $DOT_FILES/assets/images/bg.png /usr/share/xfce4/backdrops/; set_background_img.sh
```

#### Installation & Setup

1. Install i3 & i3-gaps:

```
sudo add-apt-repository ppa:regolith-linux/release; sudo apt update; sudo apt install i3 i3-gaps
```

2. Open `Session and Startup` and go to the `Session` tab

3. Change `xfwm4` & `xfdesktop` settings from `Immediately` to `Never` and save session by clicking `Save Session`

4. Add i3 to startup applications by going to `Application Autostart` tab

5. Open `Keyboard` dialogue, go to `Application Shortcuts` tab & remove keyboard shortcuts

6. Restart computer for changes to take effect:

```
reboot
```

## Other Useful Settings

#### Increase Key Speed

1. Check autorepeat rate:

```
xset -q | grep delay | grep repeat
```

2. Set autorepeat rate:

```
xset r rate 250 66
```

#### Remove Splash Screen

```
sudo sed -i 's/quiet splash//g' /etc/default/grub; update-grub
```

#### Hide Users

1. Configure display manager user settings:

```
cat << EOF | sudo tee /etc/lightdm/lightdm.conf.d/00-hide-user-list.conf
[SeatDefaults]
greeter-hide-users=true
greeter-show-manual-login=true
allow-guest=false
EOF
```

#### Configure Greeter Settings

1. Configure display manager greeter settings:

```
cat << EOF | sudo tee /etc/lightdm/lightdm-gtk-greeter.conf
[greeter]
background = /usr/share/xfce4/backdrops/bg.png
theme-name = Numix
icon-theme-name = Flat-Remix-Blue
indicators =
clock-format =
default-user-image = /usr/share/icons/Flat-Remix-Blue/apps/scalable/armitage.svg
position = 50%,center -60%,center
EOF
```

#### Add Applications to Autostart

1. Configure xfce4-terminal to autostart:

```
cat << EOF | sudo tee $XDG_CONFIG_HOME/autostart/Terminal.desktop
[Desktop Entry]
Encoding=UTF-8
Version=0.9.4
Type=Application
Name=Terminal
Comment=Startup Terminal
Exec=xfce4-terminal
OnlyShowIn=XFCE;
RunHook=0
StartupNotify=false
Terminal=false
Hidden=false
EOF
```

#### Auto Tune Powertop

1. Create powertop service:

```
cat << EOF | sudo tee /etc/systemd/system/powertop.service
[Unit]
Description=PowerTOP auto tune

[Service]
Type=oneshot
Environment="TERM=dumb"
RemainAfterExit=true
ExecStart=/usr/sbin/powertop --auto-tune

[Install]
WantedBy=multi-user.target
EOF
```

2. Reload systemd manager configuration & enable powertop service:

```
systemctl daemon-reload; systemctl enable powertop.service
```

#### Set Icons

1. Get archive file:

```
(cd /tmp; curl -O https://dl3.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE2Mzk0OTM0MzkiLCJ1IjpudWxsLCJsdCI6ImRvd25sb2FkIiwicyI6IjFjY2M3OGJhNTkwYTUzZmVkN2I0N2NlMGE2MWMwNzU2YzU1YzM5NWU2MTEwMjA0ZmJhNWY3M2I2NmNiOGIwMGQ0NTRiMjg5MTg1ZGNmZDAwY2E1YjM3MGM2NzQ5YTg1Y2Q0MDc4Y2FkYWRhZTY2MDJiMGRhNDM4ZjU2NjMwYWZlIiwidCI6MTY0MTk3MTc4OSwic3RmcCI6bnVsbCwic3RpcCI6bnVsbH0.Dxlw_-7wr7ZzvWqIz3ly5q0f7M_18h7RCFGOSJpKvr4/01-Flat-Remix-Blue_20211214.tar.xz)
```

2. Extract archive files:

```
(cd /tmp; tar -xf 01-Flat-Remix-Blue_20211214.tar.xz)
```

3. Store with architecture-independent files:

```
sudo mv /tmp/Flat-Remix-Blue-Dark /usr/share/icons/
```

4. Set icons:

```
xfconf-query -c xsettings -p /Net/IconThemeName -s Flat-Remix-Blue

```

5. Update icon cache:

```
gtk-update-icon-cache /usr/share/icons/Flat-Remix-Blue/; cd -

```

#### Set Theme

1. Get zip file:

```
(cd /tmp; curl -O https://dl2.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE1OTIyNDk1OTAiLCJ1IjpudWxsLCJsdCI6ImRvd25sb2FkIiwicyI6IjNmYjk4ZTkyYzlhMzcyNDI0OWM3ODQ3NGM2NjdhNjUxZWNmNzZlNjYzZGQ1NzhjZmY1Yzg0OGVlMzVmOTE1YjQ1MTc5YTAzMzA2YzBjZWFmZDRmMDVhMDc4ZmY4YmRkYjIyMjRjNzE4N2FjYjUzYWExMDIxZTM1ZjVmMDMxZjcxIiwidCI6MTY0MTk3MjM3MSwic3RmcCI6IjhkN2M4MGJkZDMyMzBhNDQzMzc4NTM0MDg4NjU5ZmZhIiwic3RpcCI6IjI2MDA6MTAwZjpiMTFjOmE5ZTg6NmRlOTozODE1OjJjNGU6NGQzZCJ9.ARnIMyxoq_wHv7tAQq7o_g0m_T2BtdtyO7R1Kk2GER0/Ultimate-Plata-Dark-3.36_1.9.5.zip)
```

2. Unzip compressed files:

```
(cd /tmp; unzip Ultimate-Plata-Dark-3.36_1.9.5.zip)
```

3. Store with architecture-independent files:

```
sudo mv /tmp/Ultimate-Plata-Dark-3.36 /usr/share/themes/
```

4. Set theme:

```
xfconf-query -c xsettings -p /Net/ThemeName -s Ultimate-Plata-Dark

```

##

<p align="center">
  <a href="https://github.com/natkiypie/dotfiles#natkiypies-dotfiles">Back to Top</a>
</p>
