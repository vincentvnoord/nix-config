{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };

    stylix = {
      url = "github:danth/stylix/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs =
    { nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        system = system;
        config = {
            allowUnfree = true;
            permittedInsecurePackages = [ "dotnet-sdk-6.0.428" "dotnet-runtime-6.0.36" ];
        };
      };

      pkgs-unstable = import inputs.nixpkgs-unstable {
        system = system;
        config = {
          allowUnfree = true;
          permittedInsecurePackages = [
            "dotnet-sdk-6.0.428"
            "dotnet-runtime-6.0.36"
          ];
        };
      };

      homeStateVersion = "26.05";
      user = "vincent";
      hosts = [
        {
          hostname = "desktop";
          stateVersion = "26.05";
        }
        {
          hostname = "laptop";
          stateVersion = "26.05";
        }
        {
          hostname = "framework";
          stateVersion = "26.05";
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
              pkgs-unstable
              ;
          };

        modules = [
          ./hosts/${hostname}/configuration.nix
             {
              imports = [ home-manager.nixosModules.home-manager ];

            home-manager.users.${user} = {
      home.stateVersion = stateVersion;
    };
  }
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
