#!/bin/bash
# https://github.com/ohmyzsh/ohmyzsh
#=============================================================================#
#                               Zsh Installation                              #
#=============================================================================#
echo '******************************************************************************'
echo '*                                Installing Zsh                              *'
echo '******************************************************************************'
echo '---> Updating and Upgrading the System'
sudo apt update && sudo apt upgrade -y

# Install ZSH
echo '---> Installing Zsh'
sudo apt install -y zsh

# Verify installation by running
echo '---> ZSH Installed'
zsh --version
sleep 3 # Await 3 seconds
echo

# Command to retrieve your default Shell
echo "---> Default SHELL in the system: $SHELL"
#which zsh

# Make ZSH your default shell
echo '---> Making ZSH your default SHELL'
chsh -s $(which zsh)

# Install oh-my-zsh
echo '---> Installing Oh My Zsh Script'
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#=============================================================================#
#                   Powerlevel10k  Installation (MODE 1)                      #
#=============================================================================#
#git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Go to .zshrc and modify ZSH_THEME by setting next line
#echo ZSH_THEME="powerlevel10k/powerlevel10k" >>~/.zshrc


#=============================================================================#
#                   Powerlevel10k  Installation (MODE 2)                      # 
#=============================================================================#
#                               INSTALL BREW                                  #
#=============================================================================#
echo
echo '******************************************************************************'
echo '*                             Homebrew Installation                          *'
echo '******************************************************************************'
echo
#1. Install the Homebrew dependencies if you have sudo access:
echo '---> Installing Homebrew Dependencies'
sudo apt install -y build-essential procps curl file git
#
#2. Run Homebrew installation script
echo '---> Running Homebrew Installation Script'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
#
#3. Run these two commands in your terminal to add Homebrew to your PATH
echo '---> Adding Homebrew inside your PATH'
#echo >> ~/.bashrc
#echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >>! ~/.zprofile
#eval '$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)'
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
#
#4. It's recommend that you install GCC
echo '---> Installing GCC'
brew install gcc
#
#5. Check Brew is working fine
echo '---> Checking Brew installation:' 
brew doctor
echo


#=============================================================================#
#        Download and install icons on Windows Terminal (by Microsoft)        #
#=============================================================================#
# This is a GitHub fork from romkatv repository.
echo '******************************************************************************'
echo '*       Download and install icons on Windows Terminal (by Microsoft)        *'
echo '******************************************************************************'
echo
echo 'Please download and install the following font files by click in the links below:'
echo '- https://github.com/mrtripode/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf'
echo '- https://github.com/mrtripode/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf'
echo '- https://github.com/mrtripode/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf'
echo '- https://github.com/mrtripode/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf'
echo
echo 'The script will stopped 2 minutes, letting us downloading and installing the previous 4 fonts'
echo 'After you download all of them, you must install one by one by open it and click the button [Install]'
echo '(You may neet to restart the Windows Terminal app)'
echo
echo 'Windows Terminal by Microsoft (the new thing): Open settings.json (Ctrl+Shift+,), search for fontFace and set'
echo "the value to MesloLGS NF for every profile. If you don't find fontFace, add it under profiles → defaults."
echo
echo 'See this settings file for example, by using the Windows Explorer:'
echo '%USERPROFILE%\AppData\Local\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState\settings.json'
sleep 120 # Await 2 minutes


#=============================================================================#
#                            Install Powerlevel10k                            #
#=============================================================================#
echo '******************************************************************************'
echo '*                          Installing Powerlevel10k                          *'
echo '******************************************************************************'
echo '---> Installing Powerlevel10k by Brew'
echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >>! ~/.zshrc
brew install powerlevel10k
echo "source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc



#=============================================================================#
#                          Powerlevel10k Configuration                        #
#=============================================================================#
# Answers to configurate the Powerlevel10k shell
# If it do not run automaticaly use the following comand to start the configuratio": p10k configure
# The following values are my answers configuration, use it if you want.
#
# (y) Does this look like a diamond (rotated square)?
#     --->    <---
# (y) Does this look like a lock?             
#     --->    <---
# (y) Does this look like a Debian logo (swirl/spiral)?
#     --->    <---
# (y) Do all these icons fit between the crosses?
#     --->  XXXXXXXXX  <---
#     This coud be (n)o, it depend of your display resolution
# (3) Rainbow.
# (1) Unicode.
# (2) 24-hour format.
# (4) Round.
# (4) Round.
# (5) Round.
# (2) Two lines.
# (1) Disconnected.
# (2) Left. OR (4) Full.
# (1) Lightest.
# (2) Sparse.
# (2) Many icons
# (1) Fluent.
# (y)
# (1) Verbose (recommended).
# (y) Yes.
