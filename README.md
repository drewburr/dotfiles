# dotfiles

My personal dotfiles. Currently this is setup to support Bash, as is expected to be used on MacOS. Most features are likely to work identically on alternate shells/platforms, but I can almost guarentee there will be some initial compatibility issues.

## Setup

To utilize this entire repository, clone and store in a safe location (example: `~/dotfiles`). Afterwards, append the below script to your `~/.bashrc` file.

```bash
dotfiles_path=~/dotfiles # Change this if needed
for item in $(find ~/Source -maxdepth 1 -name "*.sh"); do
  # Make it executable
  chmod +x $item
  # Source it
  source $item
done
```

Everything in this repository is designed to be modular. Don't need something? Remove it! Need something new? Add a file in! Check the features list below for how the repo operates, to determine how changes should be made.

## Features

This repository serves to provide a modular way to handle the storage and sourcing of individual dotfiles. The idea here is to make adding and removing components relatively easy, while keeping things organized.

### Source steps

See below for the steps taken when your ~/.bashrc is sourced:

- All files at `./` will be sourced as-is.
- **source_functions.sh** will source all files under `./Functions/` as-is.
  - This location is meant to house commands that are expected to be used at the CLI.
- **source_scripts.sh** will alias all files under `./Scripts/`, by name
  - For example, **./Scripts/colors.sh** will be aliased as `alias colors='~/Scripts/colors.sh'`

### Sugar and spice

The notable extras provided by these dotfiles.

| Command           | Path                       | Functionality                                                                         |
| ----------------- | -------------------------- | ------------------------------------------------------------------------------------- |
| refresh           | ./Functions/refresh.sh     | Attempts to reload the bash environment and dotfiles, without opening a new shell     |
| ansible-venvs     | ./Scripts/ansible-venvs.sh | Handles the installation and deinstallation of ansible-specific virtual environments  |
| ansiblex.x.x      | ./ansible.sh               | Provides an alias for installed ansible venvs. Please see ansible-venvs for more info |
| ksecret           | ./Scripts/ksecret.sh       | Easily generate K8s generic secrets. Supports generating sealed secrets               |
| colors            | ./Scripts/colors.sh        | Prints out terminal colors! Mainly for sanity checks                                  |
| upper             | ./tr_alias.sh              | Converts stdin to uppercase                                                           |
| lower             | ./tr_alias.sh              | Converts stdin to lowercase                                                           |
| extract           | ./Functions/extract.sh     | Will unzip/untar/unrar/... a given file. Attempts to cover all bases                  |
| kdecode           | ./Functions/kdecode.sh     | Decrypt a sealed secret from a given K8s namespace                                    |
| ksealr            | ./Functions/ksealr.sh      | Recursively encrypt unsealed K8s secrets.                                             |
| powercli / vmware | ./Functions/powercli.sh    | Drops you into a tempory Docker container with powercli installed                     |

## Packages to install

This repo makes use of the following packages, with most being optional

### Homebrew

ansible
chruby
kubectl
kubectx
nvm
visual-studio-code
