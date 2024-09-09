{ config, lib, pkgs, ... }:

{
  # Simply install just the packages
  environment.packages = with pkgs; [
    # unstable.neovim
    python313
    nodejs
    R
    nil
    texlab
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
  nix.substituters = [
    "https://nix-community.cachix.org/"
    "https://gvolpe-nixos.cachix.org"
    "https://cuda-maintainers.cachix.org"
    "https://cache.nixos.org/"
    "https://lean4.cachix.org/"
  ];
  nix.trustedPublicKeys = [
    "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    "gvolpe-nixos.cachix.org-1:0MPlBIMwYmrNqoEaYTox15Ds2t1+3R+6Ycj0hZWMcL0="
    "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
    "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    "lean4.cachix.org-1:mawtxSxcaiWE24xCXXgh3qnvlTkyU7evRRnGeAhD4Wk="
  ];

  # Set your time zone
  time.timeZone = "Europe/Berlin";

  home-manager.config = ./home.nix;
  home-manager.useGlobalPkgs = true;

  user.shell = "${pkgs.zsh}/bin/zsh";
  terminal.font = ~/.config/nix-on-droid/assets/font.ttf;
  android-integration.termux-reload-settings.enable = true;
  android-integration.termux-setup-storage.enable = true;
  android-integration.termux-open.enable = true;
  android-integration.xdg-open.enable = true;
 }
