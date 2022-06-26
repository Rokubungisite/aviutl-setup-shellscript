#!/bin/bash

read -p "WineとWinetricksをインストールしますか? *ubuntu20.04に対応しStaging branchをインストールします。(y/n): " answer
case "$answer" in
	[yY]) sudo dpkg --add-architecture i386
		wget -nc https://dl.winehq.org/wine-builds/winehq.key
		sudo apt-key add winehq.key
		sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' 
		sudo apt update
		sudo apt install --install-recommends winehq-staging -y
		sudo apt install -y winetricks
		winecfg
		;;
	[nN]) echo "終了" ;;
	*) echo "ｙかｎのキーを押してよ"
esac

read -p "wine用にフォントをインストールしますか？(y/n): " answer
case "$answer" in
	[yY])
		WINEARCH=win32 WINEPREFIX=$HOME/.wine_setting wineboot
		WINEPREFIX=$HOME/.wine_setting winetricks fakejapanese_ipamona
		WINEPREFIX=$HOME/.wine_setting winetricks fakejapanese_vlgothic
		WINEPREFIX=$HOME/.wine_setting winetricks corefonts;;
	[nN]) echo "終了" ;;
	*) echo "ｙかｎのキーを押してよ"
esac
	winecfg
	WINEARCH=win32 WINEPREFIX=$HOME/.wine_setting wineboot
	WINEPREFIX=$HOME/.wine_setting winetricks dotnet452
	wget https://raw.githubusercontent.com/gendousite/aviutl-setup-shellscript/master/aviutl.desktop
	wget https://upload.wikimedia.org/wikipedia/commons/d/d6/AviUtl_icon.png
	wget http://spring-fragrance.mints.ne.jp/aviutl/aviutl110.zip
	wget http://spring-fragrance.mints.ne.jp/aviutl/exedit93rc1.zip
	wget https://pop.4-bit.jp/bin/l-smash/L-SMASH_Works_r940_plugins.zip
	wget https://github.com/rigaya/x264guiEx/releases/download/3.03/x264guiEx_3.03.zip
	sudo apt install unar -y
	unar aviutl110.zip
	unar exedit93rc1.zip
	unar x264guiEx_3.03.zip
	unar L-SMASH_Works_r940_plugins.zip
	cp -pR exedit93rc1/* aviutl110/
	cp -r AviUtl_icon.png aviutl110/
	cp -r aviutl.desktop デスクトップ/
	mkdir aviutl110/Plugins
	cd  L-SMASH_Works_r940_plugins
	cp lwcolor.auc lwdumper.auf lwinput.aui lwmuxer.auf ../aviutl110/Plugins
	cd ..
	cd x264guiEx_3.03
	cp -r exe_files x264guiEx_readme.txt ../aviutl110
	cd plugins
	cp -r x264guiEx_stg auo_setup.auf x264guiEx.ini x264guiEx.auo ../../aviutl110/Plugins
	cd ../../
	rm -r aviutl.desktop aviutl110 AviUtl_icon.png exedit93rc1 L-SMASH_Works_r940_plugins x264guiEx_3.03 x264guiEx_3.03.zip aviutl110.zip exedit93rc1.zip L-SMASH_Works_r940_plugins.zip
