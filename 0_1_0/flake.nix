{
  description = ''A Matrix (https://matrix.org) client and appservice API wrapper for Nim!'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-matrixsdk-0_1_0.flake = false;
  inputs.src-matrixsdk-0_1_0.owner = "dylhack";
  inputs.src-matrixsdk-0_1_0.ref   = "refs/tags/0.1.0";
  inputs.src-matrixsdk-0_1_0.repo  = "matrix-nim-sdk";
  inputs.src-matrixsdk-0_1_0.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-matrixsdk-0_1_0"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-matrixsdk-0_1_0";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}