{ inputs, ... }:
{
  environment.etc =
    let
      selfPath = inputs.self.outPath;
    in
    { };
}
