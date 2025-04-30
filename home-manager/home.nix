{config, pkgs, ... }: {
	home = {
		username = "vincent";
		homeDirectory = "/home/vincent";
		stateVersion = "24.11";
	};

	imports = [
		./modules
		../nixos/modules
	];
}
