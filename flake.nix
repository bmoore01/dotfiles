{
  description = "My Home Manager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  }: let
    user = (import ./private/user-config.nix) {};
    specialArgs = {
      inherit user;
    };
  in {
    defaultPackage.${user.system} = home-manager.defaultPackage.${user.system};
    homeConfigurations = {
      "${user.username}" = home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = specialArgs;
        pkgs = import nixpkgs {system = "${user.system}";};

        modules = [
          ./home.nix
        ];
      };
    };

    # nix code formatter
    formatter.${user.system} = nixpkgs.legacyPackages.${user.system}.alejandra;
  };
}
