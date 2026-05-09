if status is-interactive
    # Commands to run in interactive sessions can go here
    toilet Jλ-Term -f mono12 --termwidth
end
set fish_greeting ""
set -g fish_key_bindings fish_vi_key_bindings
oh-my-posh init fish --config $HOME/.config/OhMyPosh/half-life.omp.json | source
