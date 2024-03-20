final: prev: {
  vscodeEnv = prev.vscode-with-extensions.override {
    vscodeExtensions = with prev.vscode-extensions; [
      bbenoist.nix
      ms-python.python
      ms-python.vscode-pylance
    ];
  };
}
