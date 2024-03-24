{
  description="First Flake";



  inputs = {
    # nixpkgs = {
    #     url = "github:NixOS/nixpkgs/nixos-unstable";
    # };
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, stylix, ...} @ inputs: 
   let
     lib = nixpkgs.lib;
     system = "x86_64-linux";
     pkgs = nixpkgs.legacyPackages.${system};
   in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        specialArgs = { inherit inputs; }; 
        inherit system;
        modules = [ 
          ./configuration.nix 
          stylix.nixosModules.stylix
          nixos-hardware.nixosModules.framework-13th-gen-intel
        ];
      };
    };
    homeConfigurations = {
      jonah = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs; }; 
        modules = [
          ./home.nix 
          stylix.homeManagerModules.stylix
        ];
      };
    };
  };

}
