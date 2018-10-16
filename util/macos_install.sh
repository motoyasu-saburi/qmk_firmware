#!/bin/bash

if ! brew --version 2>&1 > /dev/null; then
	echo "Error! Homebrew not installed or broken!"
	echo -n "Would you like to install homebrew now? [y/n] "
	while read ANSWER; do
		case $ANSWER in
			y|Y)
				/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
				break
			;;
			n|N)
				exit 1
			;;
			*)
				echo -n "Would you like to install homebrew now? [y/n] "
			;;
		esac
	done
fi
# https://www.reddit.com/r/olkb/comments/939tz6/lets_split_socketsvitamins_failing_with_default/
# 現行mac + mint60にてエラーが発生したためコメントアウト
#brew tap osx-cross/avr
brew tap PX4/homebrew-px4
brew untap osx/cross/avr
brew tap leico/avr
brew update
brew install gcc-arm-none-eabi dfu-programmer avrdude
#brew install avr-gcc@7
brew install avr-gcc@8_1
