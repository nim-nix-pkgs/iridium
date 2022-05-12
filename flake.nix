{
  description = ''The International Standard for country codes and codes for their subdivisions on Nim (ISO-3166)'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."iridium-master".dir   = "master";
  inputs."iridium-master".owner = "nim-nix-pkgs";
  inputs."iridium-master".ref   = "master";
  inputs."iridium-master".repo  = "iridium";
  inputs."iridium-master".type  = "github";
  inputs."iridium-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."iridium-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."iridium-v0_1_0".dir   = "v0_1_0";
  inputs."iridium-v0_1_0".owner = "nim-nix-pkgs";
  inputs."iridium-v0_1_0".ref   = "master";
  inputs."iridium-v0_1_0".repo  = "iridium";
  inputs."iridium-v0_1_0".type  = "github";
  inputs."iridium-v0_1_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."iridium-v0_1_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."iridium-v0_2_0".dir   = "v0_2_0";
  inputs."iridium-v0_2_0".owner = "nim-nix-pkgs";
  inputs."iridium-v0_2_0".ref   = "master";
  inputs."iridium-v0_2_0".repo  = "iridium";
  inputs."iridium-v0_2_0".type  = "github";
  inputs."iridium-v0_2_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."iridium-v0_2_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."iridium-v0_3_0".dir   = "v0_3_0";
  inputs."iridium-v0_3_0".owner = "nim-nix-pkgs";
  inputs."iridium-v0_3_0".ref   = "master";
  inputs."iridium-v0_3_0".repo  = "iridium";
  inputs."iridium-v0_3_0".type  = "github";
  inputs."iridium-v0_3_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."iridium-v0_3_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."iridium-v0_3_1".dir   = "v0_3_1";
  inputs."iridium-v0_3_1".owner = "nim-nix-pkgs";
  inputs."iridium-v0_3_1".ref   = "master";
  inputs."iridium-v0_3_1".repo  = "iridium";
  inputs."iridium-v0_3_1".type  = "github";
  inputs."iridium-v0_3_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."iridium-v0_3_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."iridium-v0_3_2".dir   = "v0_3_2";
  inputs."iridium-v0_3_2".owner = "nim-nix-pkgs";
  inputs."iridium-v0_3_2".ref   = "master";
  inputs."iridium-v0_3_2".repo  = "iridium";
  inputs."iridium-v0_3_2".type  = "github";
  inputs."iridium-v0_3_2".inputs.nixpkgs.follows = "nixpkgs";
  inputs."iridium-v0_3_2".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}