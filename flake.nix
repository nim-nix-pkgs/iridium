{
  description = ''The International Standard for country codes and codes for their subdivisions on Nim (ISO-3166)'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."iridium-master".url = "path:./master";
  inputs."iridium-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."iridium-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."iridium-v0_1_0".url = "path:./v0_1_0";
  inputs."iridium-v0_1_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."iridium-v0_1_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."iridium-v0_2_0".url = "path:./v0_2_0";
  inputs."iridium-v0_2_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."iridium-v0_2_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."iridium-v0_3_0".url = "path:./v0_3_0";
  inputs."iridium-v0_3_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."iridium-v0_3_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."iridium-v0_3_1".url = "path:./v0_3_1";
  inputs."iridium-v0_3_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."iridium-v0_3_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."iridium-v0_3_2".url = "path:./v0_3_2";
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