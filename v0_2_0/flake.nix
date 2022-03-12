{
  description = ''The International Standard for country codes and codes for their subdivisions on Nim (ISO-3166)'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-iridium-v0_2_0.flake = false;
  inputs.src-iridium-v0_2_0.owner = "KingDarBoja";
  inputs.src-iridium-v0_2_0.ref   = "refs/tags/v0.2.0";
  inputs.src-iridium-v0_2_0.repo  = "Iridium";
  inputs.src-iridium-v0_2_0.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-iridium-v0_2_0"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-iridium-v0_2_0";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}