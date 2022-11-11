if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

if [ -f ~/.profile ]; then
	. ~/.profile
fi
#export PATH="/opt/homebrew/opt/libressl/bin:$PATH"
#export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$(brew --prefix)/opt/libressl/lib/pkgconfig"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$(brew --prefix)/opt/homebrew/opt/libressl/lib/pkgconfig"
