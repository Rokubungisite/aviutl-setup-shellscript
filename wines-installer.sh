#!/bin/bash
sudo apt-get update
sudo dpkg --add-architecture i386

read -p "Wineをインストールしますか? (y/n): " answer
case "$answer" in
	[yY]) sudo apt install wine ;;
	[nN]) echo "Finish" ;;
	*) echo "Please Push y or n key."
esac

read -p "winetricksをいんすとーるしますか ? (y/n)" answer
case "$answer" in
	[yY]) 
	sudo apt install winetricks
	cd "${HOME}/Downloads"
	wget  https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
	chmod +x winetricks
	sudo cp winetricks /usr/local/bin ;;
	[nN]) echo "終了" ;;
	*) echo "ｙかｎのキーを押してよ."
esac

read -p "Aviutlを起動させるための設定を行いますか？" answer
case "$answer" in
	[yY])
	winetricks fakejapanese_ipamona
	winetricks dotnet452
	WINEARCH=win32 WINEPREFIX=$HOME/win32 winecfg
	WINEPREFIX=$HOME/wine32 winetricks allfonts
	WINEARCH=win32 WINEPREFIX=$HOME/win32 winecfg
	export WINEPREFIX=$HOME/wine32
	export WINEARCH=win32;;
	[nN]) echo "終了";;
	*) echo "ｙかｎのキーを押してよ."
esac

