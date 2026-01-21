if status is-interactive
    # Commands to run in interactive sessions go here...
end

# remove default greeting
set -g fish_greeting

# initialize starship prompt
# starship init fish | source

# initialize zoxide
zoxide init fish | source

# global environment variables
set -gx EDITOR hx
