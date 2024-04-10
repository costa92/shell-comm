#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  echo "Mac OS X"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  echo "Linux"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
  echo "Windows"
else
  echo "Other OS"
fi
