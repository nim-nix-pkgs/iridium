{
  description = ''The International Standard for country codes and codes for their subdivisions on Nim (ISO-3166)'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-iridium-master.flake = false;
  inputs.src-iridium-master.ref   = "refs/heads/master";
  inputs.src-iridium-master.owner = "KingDarBoja";
  inputs.src-iridium-master.repo  = "Iridium";
  inputs.src-iridium-master.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-iridium-master"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-iridium-master";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}