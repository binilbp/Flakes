{
  description = "KTUpdf2xl devShell";

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
        buildInputs = [ 
          (pkgs.python312.withPackages (pypkgs: with pypkgs; [ 
            pip 
            tabula-py 
            fastapi 
            python-multipart 
            pyarrow
            uvicorn
            polars
            pdfplumber
          ]))

          #jre for tabult-py
          pkgs.temurin-jre-bin

          #xlsxwriter unstable (for ver>=3.2.1)
          pkgsUnstable.python312Packages.xlsxwriter 

        ];
      };
    };
}
