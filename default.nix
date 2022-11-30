{ pkgs ? import <nixpkgs> {} }:
let
  inherit (pkgs) lib bash fd rbw jq ;
  bins = [ bash fd rbw jq ];
  
in
  pkgs.stdenvNoCC.mkDerivation {
    name="lkr";
    src = ./.;
    buildInputs = [ bash ];
    nativeBuildInputs = [ pkgs.makeWrapper ];
    installPhase = ''
      mkdir -p $out/bin
      cp lkr $out/bin/lkr
      wrapProgram $out/bin/lkr \
      --prefix PATH : ${lib.makeBinPath bins}
    '';
  }

