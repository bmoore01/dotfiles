{pkgs, ...}: {
  home.packages = with pkgs; [
    # utils
    ripgrep
    jq
    fzf

    # command runner
    just

    # markdown previewer
    glow

    #  misc
    tree
  ];
}
