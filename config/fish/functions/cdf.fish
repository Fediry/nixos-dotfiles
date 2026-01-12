function cdf
    set -l whither
    if command -sq fd
        set whither (fd --type d . $argv | fzf)
    else
        set whither (find . -type d . $argv t| fzf)
    end
    test -n "$whither"; and cd "$whither"
end
