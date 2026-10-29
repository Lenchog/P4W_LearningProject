{
  description = "Python development environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          (pkgs.python3.withPackages (
            python-pkgs: with python-pkgs; [
              flask
              bcrypt
              flask-wtf
            ]
          ))
        ];
        shellHook = ''
          python --version
        '';
      };
    };
}
