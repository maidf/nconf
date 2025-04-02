{ ... }:

{
  programs.git = {
    enable = true;
    lfs.enable = true;
    config = [
      {
        init = {
          defaultBranch = "main";
        };
        user = {
          name = "maidf";
          email = "ml@fufu.moe";
          signingkey = "~/.ssh/id_ed25519";
        };
        commit = {
          gpgsign = true;
        };
        gpg = {
          format = "ssh";
        };
        core = {
            autocrlf = "input";
        };
      }
    ];
  };
}
