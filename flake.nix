{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs = { nixpkgs.follows = "nixpkgs"; };
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        system = system;
        config.allowUnfree = true;
      };
    in {
      # NixOS Configuration
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ ./configuration.nix ];
      };

      # Home Manager Configuration
      homeConfigurations.vincent = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs;
        modules = [ ./home-manager/home.nix ];
      };

      # DevShell
      devShells.x86_64-linux.default = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [ nodejs steam-run cypress firefox ];

        shellHook = ''
            			export CYPRESS_INSTALL_BINARY=0
            			export CYPRESS_RUN_BINARY=${pkgs.cypress}/bin/Cypress
            			echo "✅ Dev shell ready. Type 'npx cypress run' to start tests."
          		'';
      };
    };
}
