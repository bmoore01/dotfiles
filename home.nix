{
  pkgs,
  user,
  ...
}: rec {
  home = {
    username = user.username;
    homeDirectory =
      if pkgs.stdenv.isDarwin
      then "/Users/${user.username}"
      else "/home/${user.username}";
    stateVersion = "22.11";

    sessionVariables = with home; {
      LANG = "en_US.UTF-8";
      LC_ALL = "en_US.UTF-8";

      WORKSPACE = "${homeDirectory}/workspace";
      PROJECTS = "${homeDirectory}/workspace/projects";
      SCRIPTS = "${homeDirectory}/workspace/scripts";
    } // user.privSessionVariables;
  };

  # XDG Config
  xdg = with home; {
    enable = true;
    dataHome = "${homeDirectory}/.local/share";
    stateHome = "${homeDirectory}/.local/state";
    configHome = "${homeDirectory}/.config";
    cacheHome = "${homeDirectory}/.cache";
  };

  # Let home manager install and manage itself
  programs.home-manager.enable = true;

  imports = with xdg; [
    ./programs.nix
    ./zsh
    ./git
    ./tmux
    ./nvim
  ];
}
