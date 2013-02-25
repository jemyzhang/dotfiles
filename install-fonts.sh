#!/bin/bash -e

echo "Checking the latest version of Nerd-fonts ..."
version=$(wget -qO - "https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest" | grep -Po '"tag_name": ?"v\K.*?(?=")')
echo "Downloading font v."$version"..."
tempdir=$(mktemp -d)
fontfile=JetBrainsMono.zip
wget -qO $tempdir/$fontfile "https://github.com/ryanoasis/nerd-fonts/releases/download/v"$version"/"$fontfile
mkdir -p $tempdir/patched-fonts
unzip $tempdir/$fontfile -d $tempdir/patched-fonts/
echo "Getting install script ..."
wget -qO $tempdir/install.sh "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/install.sh"
chmod +x $tempdir/install.sh
pushd $tempdir > /dev/null 2>&1
./install.sh
popd > /dev/null 2>&1
rm -rf $tempdir
