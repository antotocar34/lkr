{ pkgs ? import <nixpkgs> {} }:
let
  l = pkgs.lib;
  bins = builtins.attrValues { 
    inherit (pkgs) fd rbw jq age wget bat;
  };
in
  pkgs.stdenvNoCC.mkDerivation {
    name="lkr";
    src = ./.;
    buildInputs = [ pkgs.bash ];
    nativeBuildInputs = [ pkgs.makeWrapper ];
    installPhase = ''
      mkdir -p $out/bin
      cp lkr $out/bin/lkr
      wrapProgram $out/bin/lkr \
      --prefix PATH : ${l.makeBinPath bins}
    '';
  }

