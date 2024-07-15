{pkgs, ...}: {
  home.packages = with pkgs; [
    buku
    bukubrow
  ];

  programs.firefox.nativeMessagingHosts = [pkgs.bukubrow];

  shellAliases = {
    b = "buku --suggest";
    buku-fzf = "buku -p -f 4 | fzf";
    buku-url = "buku -p -f 4 | fzf | cut --fields=2";
    buku-push = "cd $XDG_DATA_HOME/buku/; git add --all; git commit --message='update db'; git push; cd -";
    buku-pull = "cd $XDG_DATA_HOME/buku/; git pull; cd -";
  };

  # `systemctl --user start buku-sync.service` to launch the service.
  # `journalctl --user -u buku-sync.service` to look at the logs.
  # systemd.user.services.buku-sync = {
  #   Unit = {
  #     Description = "Sync the database once the ssh key is unlocked";
  #   };
  #   Install = {
  #     WantedBy = ["default.target"];
  #   };
  #   Service = {
  #     ExecStart = "${pkgs.writeShellScript "buku-sync" ''
  #       SSH_KEY="$HOME/.ssh/id_rsa"
  #
  #       cd $XDG_DATA_HOME/buku/ || {
  #         echo "Failed to change directory to $XDG_DATA_HOME/buku/"
  #         exit 1
  #       }
  #
  #       is_key_added() {
  #         ssh-add -l | grep -q "$(ssh-keygen -lf $SSH_KEY | awk '{print $2}')"
  #       }
  #
  #       while ! is_key_added; do
  #         echo "Waiting for SSH key to be added"
  #         sleep 60
  #       done
  #
  #       git pull || {
  #         echo "Pull failed"
  #         exit 1
  #       }
  #
  #       if [[ $(git status --short) ]]; then
  #         git add --all
  #         git commit --message="update db"
  #         git push || {
  #           echo "Push failed"
  #           exit 1
  #         }
  #       fi
  #
  #       echo "Buku sync completed successfully"
  #     ''}";
  #   };
  # };
}
