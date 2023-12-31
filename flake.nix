{
  description = "SysConfig";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.05";
    home-manager.url = "github:nix-community/home-manager/release-23.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
	# config = { allowUnfree = true; };
      };

      lib = nixpkgs.lib;

    in {
      homeManagerConfigs = {
        ben = home-manager.lib.homeManagerConfiguration {
	  pkgs = nixpkgs.legacyPackages.${system};
	  modules = [
	    ./users/ben/home.nix
	    {
	      home = {
	        username = "ben";
	        homeDirectory = "/home/ben";
	      };
	    }
	  ];
	};
      };
      nixosConfigurations = {
        nixos = lib.nixosSystem {
	  inherit system;

	  modules = [
	    ./system/configuration.nix
	  ];
	};
      };
    };
}
