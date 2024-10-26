#!/bin/sh -e

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
which zsh

# Make ZSH your default shell
echo '---> Making ZSH your default SHELL'
sudo chsh -s $(which zsh)

# Install zsh-autosuggestions
# (This package allows you to auto-suggest commands based on your commands’ history, allowing you to access commonly used commands with ease.)
sudo apt install -y zsh-autosuggestions

# Install oh-my-zsh
echo '---> Installing Oh My Zsh Script'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


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

#2. Run Homebrew installation script
echo '---> Running Homebrew Installation Script'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#3. Run these two commands in your terminal to add Homebrew to your PATH
echo '---> Adding Homebrew inside your PATH'
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >>! ~/.zprofile
source ~/.zprofile

#4. GCC installation
echo '---> Installing GCC'
brew install gcc

#5. Check Brew is working fine
echo '---> Checking Brew installation:' 
brew doctor
echo

#=============================================================================#
#                              UNINSTALL BREW                                 #
#=============================================================================#
# Downloading and running uninstall script (Run the following commands in your terminal one by one)
#curl -O https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh
#/bin/bash uninstall.sh --help


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


# Initial 60-second wait loop with user control to skip
total_wait=120  # Total sleep time in seconds
interval=5      # Check every 5 seconds for input
elapsed=0       # Elapsed time in seconds

echo 'The script will stopped 2 minutes, letting us downloading and installing the previous 4 fonts'
echo 'After you download all of them, you must install one by one by open it and click the button [Install]'
echo '(You may neet to restart the Windows Terminal app)'
echo
echo "Waiting for $total_wait seconds. Press 'q' to skip the wait."

while [ $elapsed -lt $total_wait ]; do
    # Display remaining time
    echo "$((total_wait - elapsed)) seconds remaining..."

    # Check if user wants to skip
    echo "Press 'q' to skip, or wait $interval seconds..."
    if read -r input && [ "$input" = "q" ]; then
        echo "Skipping wait..."
        break
    fi

    # Increment elapsed time by interval
    sleep $interval
    elapsed=$((elapsed + interval))
done

echo
echo 'Windows Terminal by Microsoft (the new thing): Open settings.json (Ctrl+Shift+,), search for fontFace and set'
echo "the value to MesloLGS NF for every profile. If you don't find fontFace, add it under profiles → defaults."
echo
echo 'See this settings file for example, by using the Windows Explorer:'
echo '%USERPROFILE%\AppData\Local\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState\settings.json'


#=============================================================================#
#                   Powerlevel10k  Installation (MODE 1)                      #
#=============================================================================#
#git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Go to .zshrc and modify ZSH_THEME by setting next line
#echo ZSH_THEME="powerlevel10k/powerlevel10k" >>~/.zshrc
# 
# Remove Homebrew shell configuration
#vi ~/.zprofile
# Remove the following line:
#eval "$(/opt/homebrew/bin/brew shellenv)"


#=============================================================================#
#                   Powerlevel10k  Installation (MODE 2)                      # 
#=============================================================================#
#                        Install Powerlevel10k by Brew                        #
#=============================================================================#
# https://github.com/romkatv/powerlevel10k#manual
echo '******************************************************************************'
echo '*                          Installing Powerlevel10k                          *'
echo '******************************************************************************'
echo '---> Installing Powerlevel10k by Brew'
brew install powerlevel10k
echo Execute the two below lines:
echo "echo 'source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc"
echo source ~/.zprofile 

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
