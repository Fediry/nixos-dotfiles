{ config, pkgs, ... }:

  let
    dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
    create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
    # Standard .config/directory
    configs = {
      git = "git";
      helix = "helix";
      fish = "fish";
      nvim = "nvim";
      foot = "foot";
      rofi = "rofi";
      niri = "niri";
      dms = "DankMaterialShell";
    };
  in
  
{
  imports = [
    ./modules/neovim.nix
  ];
  home.username = "fediry";
  home.homeDirectory = "/home/fediry";
  home.stateVersion = "25.11";
  # programs.fish = {
  #   enable = true;
  #   plugins = [
  #     # Hydro
  #     { name = "hydro"; src = pkgs.fishPlugins.hydro.src; }
  #     { name = "fzf-fish"; src = pkgs.fishPlugins.fzf-fish.src; }
  #   ];
  # };
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos, btw";
      gs = "git status ";
      ga = "git add ";
      gc = "git commit ";
      l = "eza --oneline --long --header --git --icons=auto --all --group-directories-first";
      nrs = "sudo nixos-rebuild switch --impure --flake ~/nixos-dotfiles#nixos-btw";
    };
  };

  # .config files - iterate over xdg configs and map them accordingly
  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${dotfiles}/${subpath}";
    recursive = true;
  }) configs;
  
  home.packages = with pkgs; [
    # starship  # starship prompt
    helix
    foot
    ripgrep
    tealdeer
    zoxide
    git
    btop
    eza
    # Fish Shell
    fish
    fishPlugins.hydro
    fishPlugins.fzf-fish
    fzf
    gcc
    fuzzel
    rofi
    swaylock
    nil
    nixpkgs-fmt
    # Language servers
    lua-language-server
    bash-language-server
    yaml-language-server
    systemd-language-server
  ];

}
