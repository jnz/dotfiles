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

    if type "fzf" > /dev/null; then
        source ~/vimfiles/pack/plugins/start/fzf/shell/key-bindings.bash
        source ~/vimfiles/pack/plugins/start/fzf/shell/completion.bash
    fi
else
    export PATH="~/.vim/tools/ripgrep_linux/:$PATH"

    if type "fzf" > /dev/null; then
        source ~/.vim/pack/plugins/start/fzf/shell/key-bindings.bash
        source ~/.vim/pack/plugins/start/fzf/shell/completion.bash
    fi
fi

