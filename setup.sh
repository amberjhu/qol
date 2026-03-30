#!/bin/bash
# Copyright 2026 Amber Hu
echo "This is a script to help me set up Linux environments. Provided as is."
read -p "Would you like me to overwrite ~/.vimrc file? [y/N] " OVERWRITE_VIM
# Use ${VAR_NAME,,} to expand to all lowercase string and ^^ for all uppercase
if [[ ${OVERWRITE_VIM,,} == 'y' ]]; then
  echo "Copying to ~/.vimrc"
  cp ./vimrc ~/.vimrc
fi
read -p "Would you like me to overwrite ~/.bashrc file? [y/N] " OVERWRITE_BASHRC
if [[ ${OVERWRITE_BASHRC,,} == 'y' ]]; then  
  echo "copying to ~/.bashrc"
  cp ./bashrc ~/.bashrc
fi

read -p "Which package manager does this Linux distro use? (A)pt, (D)nf, (P)acman " PACKAGE_MANAGER_REPLY
if [[ ${PACKAGE_MANAGER_REPLY,,} == 'a' ]]; then
  PACKAGE_MANAGER='apt'
elif [[ ${PACKAGE_MANAGER_REPLY,,} == 'd' ]]; then
  PACKAGE_MANAGER='dnf'
elif [[ ${PACKAGE_MANAGER_REPLY,,} == 'p' ]]; then
  PACKAGE_MANAGER='pacman'
  echo "Not implemented yet"
  exit 67
else
  echo "Could not recognize prompt response, quitting"
  exit 1
fi
echo "Using package manager $PACKAGE_MANAGER"

check_installed() {
  if [[ $PACKAGE_MANAGER == 'apt' ]]; then
    apt list --installed $1 | grep "installed"
    return $?
  elif [[ $PACKAGE_MANAGER == 'dnf' ]]; then
    dnf list installed $1
    return $?
  else
    echo "Not implemented!"
    exit 67
  fi
}

install_package() {
  if [[ $PACKAGE_MANAGER == 'apt' ]]; then
    sudo apt install $1
    return $?
  elif [[ $PACKAGE_MANAGER == 'dnf' ]]; then
    sudo dnf install $1
    return $?
  else
    echo "Not implemented!"
    exit 67
  fi
}

check_and_install() {
  echo "Installing $1..."
  check_installed $1 || install_package $1
}

ESSENTIAL_PACKAGES="git curl wget vim"
echo "Installing the essentials: $ESSENTIAL_PACKAGES"
for package in $ESSENTIAL_PACKAGES; do
  check_and_install $package
done

read -p "Would you like to generate SSH keys? [y/N] " GEN_SSH_KEYS
if [[ ${GEN_SSH_KEYS,,} == 'y' ]]; then
  ssh-keygen
fi
read -p "Would you like to add an SSH host to the config file? [y/N] " ADD_SSH_CONFIG
if [[ ${ADD_SSH_CONFIG,,} == 'y' ]]; then
  read -p "Nickname: " HOST_NICKNAME && read -p "Hostname (without http://) " HOST_HOSTNAME \
    && read -p "User: " HOST_USERNAME \
    && printf "Host $HOST_NICKNAME\nHostName $HOST_HOSTNAME\nUser $HOST_USERNAME\n\n" >> ~/.ssh/config
fi
read -p "Would you like to copy your SSH keys to another host? Requires username/password for that host [y/N]" SSH_COPY_ID_REPLY
if [[ ${SSH_COPY_ID_REPLY,,} == 'y' ]]; then
  read -p "Hostname: " SSH_COPY_ID_HOSTNAME
  read -p "Username: " SSH_COPY_ID_USERNAME
  ssh-copy-id "${SSH_COPY_ID_USERNAME}@${SSH_COPY_ID_HOSTNAME}"
fi

read -p "Would you like to install Rust using rustup? [y/N] " INSTALL_RUSTUP
if [[ ${INSTALL_RUSTUP,,} == 'y' ]]; then
  # Officially endorsed command for unix as of March 2026
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi
