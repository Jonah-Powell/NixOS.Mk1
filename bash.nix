{config, pkgs, ...}:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      ".." = "cd ..";
      c = "clear";
      lt = "ls -h -s -1 -S --classify";
      fetchneo = "nix-shell -p neofetch";
      gpart = "sudo -E gparted";

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
      
      #Python Coding aliases
      phyfiles = "cd ~/Documents/phy115L";
      phydev = ''cd ~/Documents/phy115L
      nix-shell'';
    };
  };
}