if status is-interactive 
    # Commands to run in interactive sessions can go here
    
    if [ -x "$(command -v tmux)" ] && [ -n "$DISPLAY" ] && [ -z "$TMUX" ] 
        tmux attach -t Home || tmux new -s Home
    end

    # fzf --fish | source
    source ~/.fzfrc

    # if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
    #     exec tmux new-session -A -s ${USER} >/dev/null 2>&1
    #     fi

end
