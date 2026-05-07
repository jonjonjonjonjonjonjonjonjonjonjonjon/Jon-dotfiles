if status is-interactive
    # Commands to run in interactive sessions can go here
end
set fish_greeting ""
oh-my-posh init fish --config $HOME/.config/OhMyPosh/half-life.omp.json | source
fish_add_path /home/hp/.clispot/bin

export SPOTIFY_CLIENT_ID="dc3f4e38f41644e29b2666a0bda91d6f"
export SPOTIFY_CLIENT_SECRET="58b508b343064eefa4ebe67d24e62450"
export BEMOJI_TYPE_CMD="wtype"
