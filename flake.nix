{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    devShells."x86_64-linux".default = pkgs.mkShell {
      #      # could also be buildInputs,, for my purposes it do not matter: https://discourse.nixos.org/t/difference-between-buildinputs-and-packages-in-mkshell/60598/2
      packages = with pkgs; [
        (python311.withPackages (ps:
          with ps; [
            pygame-ce
          ]))
      ];
    };
    #env variables..
    #env.RUST_SRC_PATH = "${pkgs.rust.blablabla.rustLibSrc}";
  };
}
