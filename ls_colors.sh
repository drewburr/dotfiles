#!/bin/bash

export CLICOLOR=1

# # Lettering for colors (Uppercase for bold)
# x default
# a black
# b red
# c green
# d brown
# e blue
# f magenta
# g cyan
# h light grey

# # Coloring order (First letter foreground, Second letter background)
# DO NOT CHANGE THIS ORDER
array=(
  Ex # directory
  Gx # symbolic link
  Bx # socket
  Dx # pipe
  Cx # executable
  Eg # block special
  Ed # character special
  xb # executable with setuid bit set
  xg # executable with setgid bit set
  xc # directory writable to others, with sticky bit
  xd # directory writable to others, without sticky bit
)

for item in ${array[@]}; do
  COLORS+=$item
done

export LSCOLORS=$COLORS
