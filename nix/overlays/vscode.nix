final: prev: {
  vscodeEnv = prev.vscode-with-extensions.override {
    vscode = prev.vscodium;
    vscodeExtensions = with prev.vscode-extensions; [
      bbenoist.nix
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
      esbenp.prettier-vscode
      jnoortheen.nix-ide
      ms-pyright.pyright
      ms-python.python
      ms-python.vscode-pylance
      ms-toolsai.jupyter
      ms-toolsai.jupyter-keymap
      ms-toolsai.jupyter-renderers
      ms-toolsai.vscode-jupyter-cell-tags
      ms-toolsai.vscode-jupyter-slideshow
    ];
  };
}
