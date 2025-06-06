{
  description = "Pure Rust Shell";

  inputs = {
    nixpkgsUnstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs24_11.url = "github:nixos/nixpkgs?ref=nixos-24.11";
  };

  outputs = { self, nixpkgsUnstable , nixpkgs24_11}: 

    let
      pkgsUnstable = nixpkgsUnstable.legacyPackages.x86_64-linux;
      pkgs = nixpkgs24_11.legacyPackages.x86_64-linux;

    in {
      devShells.x86_64-linux.default = pkgs.mkShell { #this "pkgs" is command
        buildInputs = with pkgsUnstable; [ 
            rustc
            cargo
            rust-analyzer
            rustfmt
	    clippy
        ];
      };
    };
}
