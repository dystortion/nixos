{ pkgs, ... }:
{
  services.jupyter =
    let
      user = "user";
      env =
        pkgs.python3.withPackages (
          pythonPackages: with pythonPackages; [
            ipykernel
            pandas
            scikit-learn
          ]
        )
      ;
    in
    {
      enable = true;
      command = "jupyter-lab";
      inherit user;
      group = user;
      port = 5879;
      package = pkgs.python3Packages.jupyter;
      kernels = {
        python3 = {
          displayName = "Python 3 for machine learning";
          argv = [
            "${env.interpreter}"
            "-m"
            "ipykernel_launcher"
            "-f"
            "{connection_file}"
          ];
          language = "python";
          logo32 = "''${env.sitePackages}/ipykernel/resources/logo-32x32.png";
          logo64 = "''${env.sitePackages}/ipykernel/resources/logo-64x64.png";
          extraPaths = {
            "cool.txt" = pkgs.writeText "cool" "cool content";
          };
        };
      };
    };
}
