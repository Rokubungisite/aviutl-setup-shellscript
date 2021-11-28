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

read -p "Aviutlとx264guiExのセットアップを行いますか？(y/n)" answer
case "$answer" in
	[yY])
	wget https://gwdhla.dm.files.1drv.com/y4mSzKeZxrlo7VJZeAYXkbtM4OtK3r7L8PqzXhLVXVFkKzYe3J96cjwLA6MHUynyKaPqQahP_qb4sgje9NSoXZFfe8rVtmK7VHV9deOdShrqljJFW1_IPrw9cMgaNA9vH_97KWbHAKVrs3tc_BCwyiY3SnY0HPWfx-nOEnaqC0rz3MEyv7ec8qahAKw3hhBgAAZ/x264guiEx_2.68.zip
	sudo apt install unar -y
	unar x264guiEx_2.68.zip
	WINEARCH=win32 WINEPREFIX=$HOME/wine32 wineboot
	WINEPREFIX=$HOME/wine32 winetricks allfonts
	WINEPREFIX=$HOME/wine32 winetricks fakejapanese_ipamona
	WINEPREFIX=$HOME/wine32 winetricks dotnet452
	WINEARCH=win32 WINEPREFIX=$HOME/wine32 winecfg
	WINEPREFIX=$HOME/.wine32 wine x264guiEx_2.68/auo_setup.exe;;
	[nN]) echo "終了";;
	*) echo "ｙかｎのキーを押してよ."
esac

read -p "使用したフォルダを削除しますか? (y/n)" answer
case "$answer" in
	[yY]) 
	rm -r x264guiEx_2.68;;
	[nN]) echo "終了" ;;
	*) echo "ｙかｎのキーを押してよ."
esac

