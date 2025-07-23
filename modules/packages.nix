{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  programs.neovim.enable = true;
  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  programs.firefox.enable = true;

  environment.systemPackages = [
    pkgs.wget
    pkgs.git
    pkgs.vscode
    pkgs.discord
    pkgs.element-desktop
  ];
}