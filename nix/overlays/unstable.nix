{ inputs, ... }:
{
  unstablePkgs = final: _prev: {
    unstable = import inputs.unstable {
      inherit (final) system;
      config.allowUnfree = true;
    };
  };
}
