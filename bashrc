source /etc/skel/.bashrc
stty -ixon
export VISUAL=vi
export EDITOR="$VISUAL"
export PATH="~/.vim/tools/ripgrep_linux/:$PATH"

if type "fzf" > /dev/null; then
    source /usr/share/doc/fzf/examples/key-bindings.bash
    source /usr/share/doc/fzf/examples/completion.bash
fi
