
alias vi "nvim"
alias vim "nvim"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.spicetify
