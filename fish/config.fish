if status is-interactive
    # Commands to run in interactive sessions can go here
    toilet Jλ-Term -f mono12 --termwidth
end
set fish_greeting ""
oh-my-posh init fish --config $HOME/.config/OhMyPosh/half-life.omp.json | source
