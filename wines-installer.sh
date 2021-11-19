#!/bin/bash
sudo apt-get update
sudo dpkg --add-architecture i386

read -p "Can I install wine  ? (y/n): " answer
case "$answer" in
	[yY]) sudo apt install wine ;;
	[nN]) echo "Finish" ;;
	*) echo "Please Push y or n key."
esac

read -p "Can I install winetricks ? (y/n)" answer
case "$answer" in
	[yY]) 
	cd "${HOME}/Downloads"
	wget  https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
	chmod +x winetricks
	sudo cp winetricks /usr/local/bin 
	winetricks fakejapanese_ipamona;;
	[nN]) echo "Finish" ;;
	*) echo "Please  Push y or n key."
esac

read -p "
Would you need install  To start  Aviutl.
Can I install  same software ?(y/n) 
* this action need  finish install Aviutl. " answer
case "$answer" in
	[yY])
	WINEARCH=win32 WINEPREFIX=$HOME/win32 winecfg
	WINEPREFIX=$HOME/wine32 winetricks allfonts
	WINEARCH=win32 WINEPREFIX=$HOME/win32 winecfg
	export WINEPREFIX=$HOME/wine32
	export WINEARCH=win32
	LANG=ja_JP.utf8 wine aviutl.exe
	winetricks dotnet45;;
	[nN]) echo "Finish";;
	*) echo "Please  Push y or n key."
esac

