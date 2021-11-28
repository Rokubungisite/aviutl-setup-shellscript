#!/bin/bash
sudo apt-get update
sudo dpkg --add-architecture i386

read -p "Ubuntu18.04,Ubuntu 19.04,Ubuntu 19.10ですか? 依存関係にあるFAudioをインストールします。(y/n): " answer
case "$answer" in
	[yY])wget https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_18.04/amd64/libfaudio0_19.07-0~bionic_amd64.deb
	　　　wget https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_18.04/i386/libfaudio0_19.07-0~bionic_i386.deb
	　　　sudo dpkg -i libfaudio0_19.07-0~bionic_amd64.deb libfaudio0_19.07-0~bionic_i386.deb;;
	[nN]) echo "終了" ;;
	*) echo "ｙかｎのキーを押してよ"
esac

read -p "WineとWinetricksをインストールしますか? (y/n): " answer
case "$answer" in
	[yY]) sudo apt install wine  -y
              sudo apt-get install winetricks -y
	      winecfg
	      WINEARCH=win32 WINEPREFIX=$HOME/.wine32 wineboot;;
	[nN]) echo "終了" ;;
	*) echo "ｙかｎのキーを押してよ"
esac

read -p "aviutlのセットアップを行います。※wineの設定(windowsバージョン)はxpにしてください。(y/n)" answer
case "$answer" in
	[yY]) 
	cd "${HOME}/Downloads"
	wget  https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
	chmod +x winetricks
	sudo cp winetricks /usr/local/bin
	wget http://spring-fragrance.mints.ne.jp/aviutl/aviutl110.zip
	wget http://spring-fragrance.mints.ne.jp/aviutl/exedit93rc1.zip
	wget https://gwdhla.dm.files.1drv.com/y4mSzKeZxrlo7VJZeAYXkbtM4OtK3r7L8PqzXhLVXVFkKzYe3J96cjwLA6MHUynyKaPqQahP_qb4sgje9NSoXZFfe8rVtmK7VHV9deOdShrqljJFW1_IPrw9cMgaNA9vH_97KWbHAKVrs3tc_BCwyiY3SnY0HPWfx-nOEnaqC0rz3MEyv7ec8qahAKw3hhBgAAZ/x264guiEx_2.68.zip
	wget https://pop.4-bit.jp/bin/l-smash/L-SMASH_Works_r940_plugins.zip
	sudo apt install unar -y
	unar aviutl110.zip
	unar exedit93rc1.zip
	unar x264guiEx_2.68.zip
	unar L-SMASH_Works_r940_plugins.zip
	cp -pR exedit93rc1/* aviutl110/
	mkdir aviutl110/Plugins
	cd  L-SMASH_Works_r940_plugins
	cp lwcolor.auc lwdumper.auf lwinput.aui lwmuxer.auf ../aviutl110/Plugins
	cd ../
	cp -r aviutl110 デスクトップ/
	WINEARCH=win32 WINEPREFIX=$HOME/.wine32 winecfg
	WINEPREFIX=$HOME/.wine32 winetricks allfonts
	WINEPREFIX=$HOME/.wine32 winetricks dotnet452
	WINEPREFIX=$HOME/.wine32 winetricks fakejapanese_ipamona
	WINEPREFIX=$HOME/.wine32 wine x264guiEx_2.68/auo_setup.exe
	firefox https://aviutl.info/l-smash-works/#toc5
	rm -r x264guiEx_2.68 aviutl110 exedit93rc1 L-SMASH_Works_r940_plugins x264guiEx_2.68.zip aviutl110.zip exedit93rc1.zip L-SMASH_Works_r940_plugins.zip;;
	[nN]) echo "終了" ;;
	*) echo "ｙかｎのキーを押してよ"
esac
