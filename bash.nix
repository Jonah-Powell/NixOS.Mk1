{config, pkgs, ...}:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      ".." = "cd ..";
      c = "clear";
      dotf = "cd ~/.dotfiles";
      etcnix = "cd /etc/nixos";
      lt = "ls -h -s -1 -S --classify";
      hrebuild = "home-manager switch --flake .";
      srebuild = "sudo nixos-rebuild switch --flake .";
      cleanup = "sudo nix-collect-garbage";
      sysconfig = "codium ~/.dotfiles/configuration.nix";
      homeconfig = "codium ~/.dotfiles/home.nix";
      flakeconfig = "codium ~/.dotfiles/flake.nix";
    };
  };
}