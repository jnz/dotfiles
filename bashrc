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
        source ~/vimfiles/tools/fzf_shell/key-bindings.bash
        source ~/vimfiles/tools/fzf_shell/completion.bash
    fi
else
    export PATH="~/.vim/tools/ripgrep_linux/:$PATH"

    if type "fzf" > /dev/null; then
        source /usr/share/doc/fzf/examples/key-bindings.bash
        source /usr/share/doc/fzf/examples/completion.bash
    fi
fi

