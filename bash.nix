{config, pkgs, ...}:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      ".." = "cd ..";
      c = "clear";
      lt = "ls -h -s -1 -S --classify";

      # NixOS Config aliases
      dotf = "cd ~/.dotfiles";
      dotfconf = "codium ~/.dotfiles";
      etcnix = "cd /etc/nixos";
      hrebuild = "home-manager switch --flake .";
      srebuild = "sudo nixos-rebuild switch --flake .";
      flakeup = "sudo nix flake update";
      cleanup = "sudo nix-collect-garbage";
      sysconfig = "codium ~/.dotfiles/configuration.nix";
      homeconfig = "codium ~/.dotfiles/home.nix";
      flakeconfig = "codium ~/.dotfiles/flake.nix";
      goog = ''export NIXPKGS_ALLOW_UNFREE=1
      nix-shell -p google-chrome --impure'';
      fetchneo = "nix-shell -p neofetch";
      
      #Python Coding aliases
      phyfiles = "cd ~/Documents/phy115L";
      phydev = ''cd ~/Documents/phy115L
      nix-shell'';
    };
  };
}