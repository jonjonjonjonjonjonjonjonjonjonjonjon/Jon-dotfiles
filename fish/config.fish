if status is-interactive
    # Commands to run in interactive sessions can go here
end
set fish_greeting "
    ▄▄▄▄▄  ▄▄▄                 ▄▄▄▄▄▄▄▄                               
    ▀▀▀██  ▀▀██▄               ▀▀▀██▀▀▀                               
       ██     ██                  ██      ▄████▄    ██▄████  ████▄██▄ 
       ██    ████                 ██     ██▄▄▄▄██   ██▀      ██ ██ ██ 
       ██   ██▀██▄    █████       ██     ██▀▀▀▀▀▀   ██       ██ ██ ██ 
 █▄▄▄▄▄██  ▄██  ██▄               ██     ▀██▄▄▄▄█   ██       ██ ██ ██ 
  ▀▀▀▀▀    ▀▀    ▀▀               ▀▀       ▀▀▀▀▀    ▀▀       ▀▀ ▀▀ ▀▀ 
  "
set -g fish_key_bindings fish_vi_key_bindings
oh-my-posh init fish --config $HOME/.config/OhMyPosh/half-life.omp.json | source
set -gx mask_char '*'
set PATH ~/.local/bin/:$PATH

alias v vis
alias t tmux
alias ta "tmux attach"
alias tk "tmux kill-session"
alias mm "~/.llama-app/llama cli -hf mistralai/Ministral-3-3B-Reasoning-2512-GGUF:Q5_K_M -fa auto -c 8192 -ngl 99"
alias mb "~/.llama-app/llama cli -hf mistralai/Ministral-3-8B-Reasoning-2512-GGUF:Q4_K_M -fa auto -c 8192 -ngl 23"
alias A " ~/.llama-app/llama cli -hf duarteocarmo/AMALIA-9B-0626-DPO-GGUF:Q5_K_M -fa auto -c 8192 -ngl 23"
