{
  description = "NodeJs 24 shell";

  inputs = {
    nixpkgsUnstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs25_05.url = "github:nixos/nixpkgs?ref=nixos-25.05";
  };

  outputs = { self, nixpkgsUnstable , nixpkgs25_05}: 

    let
      pkgsUnstable = nixpkgsUnstable.legacyPackages.x86_64-linux;
      pkgs = nixpkgs25_05.legacyPackages.x86_64-linux;

    in {
      devShells.x86_64-linux.default = pkgs.mkShell { #this "pkgs" is command
        buildInputs = with pkgs; [ 
		nodejs_24
        ];
      };
    };
}
