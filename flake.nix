{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };

    stylix = {
      url = "github:danth/stylix/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        system = system;
        config.allowUnfree = true;
      };
      homeStateVersion = "24.11";
      user = "vincent";
      hosts = [
        {
          hostname = "desktop";
          stateVersion = "24.11";
        }
        {
          hostname = "laptop";
          stateVersion = "24.11";
        }
      ];

      makeSystem =
        { hostname, stateVersion }:
        nixpkgs.lib.nixosSystem {
          system = system;
          specialArgs = {
            inherit
              inputs
              stateVersion
              hostname
              user
              ;
          };

          modules = [
            ./hosts/${hostname}/configuration.nix
            home-manager.nixosModules.home-manager
          ];
        };
    in
    {
      nixosConfigurations = nixpkgs.lib.foldl' (
        configs: host:
        configs
        // {
          "${host.hostname}" = makeSystem { inherit (host) hostname stateVersion; };
        }
      ) { } hosts;

      # DevShell
      devShells.x86_64-linux.default = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
          nodejs
          steam-run
          cypress
          firefox
        ];

        shellHook = ''
            			export CYPRESS_INSTALL_BINARY=0
            			export CYPRESS_RUN_BINARY=${pkgs.cypress}/bin/Cypress
            			echo "✅ Dev shell ready. Type 'npx cypress run' to start tests."
          		'';
      };
    };
}
