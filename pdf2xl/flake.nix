{
  description = "KTUpdf2xl devShell";

  inputs = {
    nixpkgsUstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs24_11.url = "github:nixos/nixpkgs?ref=nixos-24.11";
  };

  outputs = { self, nixpkgsUnstable , nixpkgs24_11}: 

    let
      pkgsUnstable = nixpkgsUnstable.legacyPackages.x86_64-linux;
      pkgs = nixpkgs24_11.legacyPackages.x86_64-linux;

    in {
      devShells.x86_64-linux.default = pkgs.mkShell {
        buildInputs = with pkgs;[ 
          (python312.withPackages (pypkgs: with pypkgs; [ 
            pip 
            tabula-py 
            xlsxwriter 
            fastapi 
            multipart 
            pyarrow
            uvicorn
            polars
            pdfplumber
          ]))

          #jre for tabult-py
          temurin-jre-bin
        ];
    };
  };
}
