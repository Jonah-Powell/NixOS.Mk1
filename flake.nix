{
  description="First Flake";



  inputs = {
    # nixpkgs = {
    #     url = "github:NixOS/nixpkgs/nixos-unstable";
    # };
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, home-manager, ...} @ inputs: 
   let
     lib = nixpkgs.lib;
     system = "x86_64-linux";
     pkgs = nixpkgs.legacyPackages.${system};
   in {
    nixosConfigurations = {
      nixos-vm = lib.nixosSystem {
        specialArgs = { inherit inputs; }; 
        inherit system;
        modules = [ ./configuration.nix ];
      };
    };
    homeConfigurations = {
      jonah = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];
      };
    };
  };

}