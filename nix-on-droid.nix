{ config, lib, pkgs, ... }:

{
  # Simply install just the packages
  environment.packages = with pkgs; [
    neovim
    ripgrep
    gnused
    findutils
    man
    wget
    sudo
    su
    # rPackages.languageserver
    lua
    lua53Packages.lua-lsp
    lua53Packages.jsregexp
    clang
    (haskellPackages.ghcWithPackages (hpkgs: with hpkgs; [
      text-format-simple
    ]))
    haskell-language-server
    haskellPackages.haskell-dap
    haskellPackages.ghci-dap
    haskellPackages.haskell-debug-adapter
    cabal-install
    cargo
    fastfetch

    # Some common stuff that people expect to have
    #procps
    #killall
    #diffutils
    #findutils
    #utillinux
    #tzdata
    #hostname
    #man
    #gnugrep
    #gnupg
    #gnused
    gnutar
    bzip2
    gzip
    xz
    zip
    unzip
  ];

  # Backup etc files instead of failing to activate generation if a file already exists in /etc
  environment.etcBackupExtension = ".bak";

  # Read the changelog before changing this value
  system.stateVersion = "24.05";

  # Set up nix for flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  nix.registry = {
    nixpkgs.to = {
      type = "path";
      path = pkgs.path;
      # narHash = pkgs.narHash;
    };
  };

  # Set your time zone
  time.timeZone = "Europe/Berlin";

  home-manager.config = ./home.nix;

  user.shell = "${pkgs.zsh}/bin/zsh";
  terminal.font = ~/.config/nix-on-droid/assets/font.ttf;
  android-integration.termux-reload-settings.enable = true;
  android-integration.termux-setup-storage.enable = true;
  android-integration.termux-open.enable = true;
  android-integration.xdg-open.enable = true;
 }
