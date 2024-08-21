{ config, pkgs, attrs, ... }:
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      # Monti
      montissh = "TERM=xterm-256color ssh mmbs@monti.ai";
      montipostgres = "ssh -L 5432:localhost:5432 mmbs@monti.ai";
      '';

      l = "${pkgs.eza}/bin/eza";
      lg = "lazygit";
      ll = "eza --long --icons --color --hyperlink";
      lt = "eza --long --tree --icons --color --hyperlink";
      v = "nvim";
      vi = "nvim";
      vim = "nvim";

      # shortcuts
      o = "xdg-open";
    };
    cdpath = [ ];
  };
  programs.direnv = {
    enable = true;
    enableBashIntegration = false;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    nix-direnv.enable = true;
  };
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      set -o vi
      bind -m vi-command 'Control-l: clear-screen'
      bind -m vi-insert 'Control-l: clear-screen'
    '';
    enableCompletion = true;
    sessionVariables = {
      VISUAL = "nvim";
      EDITOR = "nvim";
    };
  };
  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
  };
  programs.readline = {
    enable = true;
    variables = {
      # see https://www.man7.org/linux/man-pages/man3/readline.3.html
      editing-mode = "vi";
      keymap = "vi";
      completion-ignore-case = "on";
      show-all-if-ambiguous = "on";
    };
  };
  # ipython vim bindings
  home.file.".ipython/profile_default/ipython_config.py".text = ''
    c.TerminalInteractiveShell.editing_mode = 'vi'
  '';
  # ghci vim bindings
  home.file.".haskeline".text = ''
    editMode: Vi
  '';
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
  };
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
  };
  programs.carapace = {
    enable = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;
  };
  programs.atuin = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
  };
  programs.atuin.settings = {
    keymap_mode = "auto";
  };
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    settings = {
      add_newline = true;
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };
    };
  };
  home.stateVersion = "24.05";
}
