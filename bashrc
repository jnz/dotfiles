if [ -f /etc/skel/.bashrc ]; then
   source /etc/skel/.bashrc
fi
stty -ixon
export VISUAL=vi
export EDITOR="$VISUAL"

case "$OSTYPE" in
  msys*)    OS="windows" ;;
  cygwin*)  OS="windows" ;;
  *)        OS="notwindows" ;;
esac

if [ "$OS" == "windows" ]; then
    export PATH="~/vimfiles/tools/ripgrep_win/:$PATH"
else
    export PATH="~/.vim/tools/ripgrep_linux/:$PATH"
fi

