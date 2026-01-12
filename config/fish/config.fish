if status is-interactive
    # Commands to run in interactive sessions go here...
end

# remove default greeting
set -g fish_greeting

# initialize starship prompt
# starship init fish | source

# Change fzf key binding for variables from default to Ctrl+Alt+v
# fzf_configure_bindings --variable=\e\cv

# initialize zoxide
zoxide init fish | source

# global environment variables
set -gx EDITOR hx
