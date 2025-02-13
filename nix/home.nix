{ pkgs, lib, ... }:
let
  dwmBlocks = pkgs.dwmblocks.overrideAttrs {
    src = ./dwmblocks;
  };
in
{
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./rofi
    ./wezterm
    ./picom.nix
    ./lvim
    ./neofetch
    ./skippy-xd
    ./cava
    ./mpv
    ./ranger
    # ./bin/set_resolution.nix
  ];

  home.packages = with pkgs; [
    dwmBlocks
    virtualbox
    pulseaudio
    pamixer
    pavucontrol
    procps
    brightnessctl
    xclip
    google-chrome
    flameshot
    git
    eza
    discord
    bat
    gh
    notify-osd
    libnotify
    acpi
    wirelesstools
    torrential
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      nix-switch = "sudo nixos-rebuild switch --flake $HOME/nix-dotfiles";
      nix-boot = "sudo nixos-rebuild boot --flake $HOME/.dotfiles";
      nix-clean = "sudo nix-collect-garbage --delete-old";
      ls = "eza --group-directories-first --icons -GaF";
      tree = "exa --tree --icons";
      nvim = "lvim";
      cls = "clear";
    };

    history = {
      size = 100000;
      save = 100000;
      ignoreSpace = true;
      share = true;
    };

    initExtra = ''
      bindkey -v

      zstyle ":completion:*" auto-description "specify: %d"
      zstyle ":completion:*" completer _expand _complete _correct _approximate
      zstyle ":completion:*" format "Completing %d"
      zstyle ":completion:*" group-name ""
      eval "$(dircolors -b)"
      zstyle ":completion:*:default" list-colors "''${(s.:.)LS_COLORS}"
      zstyle ":completion:*" list-colors ""
      zstyle ":completion:*" list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
      zstyle ":completion:*" matcher-list "" "m:{a-z}={A-Z}" "m:{a-zA-Z}={A-Za-z}" "r:|[._-]=* r:|=* l:|=*"
      zstyle ":completion:*" menu select=long
      zstyle ":completion:*" select-prompt %SScrolling active: current selection at %p%s
      zstyle ":completion:*" use-compctl false
      zstyle ":completion:*" verbose true


      zstyle ":completion:*" menu yes select

      zstyle ":completion:*:*:kill:*:processes" list-colors "=(#b) #([0-9]#)*=0=01;31"
      zstyle ":completion:*:kill:*" command "ps -u $USER -o pid,%cpu,tty,cputime,cmd"


      eval "$(starship init zsh)"
    '';
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = true;

      # A minimal left prompt
      # format = """$directory$character"""
      format = "[  ](bold cyan)$os$all$directory$character";
      palette = "catppuccin_mocha";
      # move the rest of the prompt to the right
      right_format = "$cmd_duration$username$hostname";

      cmd_duration = {
        min_time = 2000;
        style = "bold maroon";
        format = "[ $duration ]($style)";
      };

      aws = {
        format = "[$symbol($profile )(\\($region\\) )]($style)";
        style = "bold blue";
        symbol = "  ";
      };

      time = {
        format = "[$time]($style) ";
      };

      azure = {
        format = "[$symbol($subscription)]($style) ";
      };

      golang = {
        format = "[$symbol($version )]($style)";
        symbol = " ";
      };

      username = {
        format = "[$user]($style)";
      };

      kubernetes = {
        symbol = "☸ ";
        disabled = false;
        detect_files = [ "Dockerfile" ];
        format = "[$context(\\[$namespace\\])]($style) ";
      };

      kubernetes.context_aliases = {
        "arn:aws:eks:us-west-2:577926974532:cluster/gal-kub-demo-cluster" = "gal";
      };

      docker_context = {
        disabled = true;
        format = "[$symbol$context]($style) ";
      };

      dotnet = {
        format = "[$symbol($version )(🎯 $tfm )]($style)";
      };

      line_break = {
        disabled = false;
      };

      buf = {
        format = "[$symbol($version )]($style)";
        symbol = " ";
      };

      c = {
        symbol = " ";
        format = "[$symbol($version(-$name) )]($style)";
      };

      typst = {
        format = "[$symbol($version )]($style)";
      };

      vagrant = {
        format = "[$symbol($version )]($style)";
      };

      vlang = {
        format = "[$symbol($version )]($style)";
      };

      cmake = {
        format = "[$symbol($version )]($style)";
      };

      conda = {
        symbol = " ";
        format = "[$symbol$environment]($style) ";
      };

      cobol = {
        format = "[$symbol($version )]($style)";
      };

      crystal = {
        format = "[$symbol($version )]($style)";
        symbol = " ";
      };

      dart = {
        symbol = " ";
        format = "[$symbol($version )]($style)";
      };

      deno = {
        format = "[$symbol($version )]($style)";
      };

      directory = {
        read_only = " 󰌾";
        truncate_to_repo = false;
        truncation_length = 3;
        fish_style_pwd_dir_length = 4;
      };

      elixir = {
        format = "[$symbol($version \\(OTP $otp_version\\) )]($style)";
        symbol = " ";
      };

      elm = {
        symbol = " ";
        format = "[$symbol($version )]($style)";
      };

      erlang = {
        format = "[$symbol($version )]($style)";
      };

      fennel = {
        format = "[$symbol($version )]($style)";
        symbol = " ";
      };

      gcloud = {
        format = "[$symbol$account(@$domain)(\\($region\\))]($style) ";
      };

      fossil_branch = {
        format = "[$symbol$branch]($style) ";
        symbol = " ";
      };

      git_branch = {
        format = "[$symbol$branch(:$remote_branch) ]($style)";
        symbol = " ";
      };

      guix_shell = {
        symbol = " ";
        format = "[$symbol]($style)";
      };

      gradle = {
        format = "[$symbol($version )]($style)";
      };

      haskell = {
        format = "[$symbol($version )]($style)";
        symbol = " ";
      };

      haxe = {
        symbol = " ";
        format = "[$symbol($version )]($style)";
      };

      helm = {
        format = "[$symbol($version )]($style)";
      };

      hg_branch = {
        symbol = " ";
      };

      hostname = {
        ssh_symbol = " ";
        format = "@[$hostname $ssh_symbol]($style) ";
      };

      java = {
        symbol = " ";
        format = "[\${symbol}(\${version} )]($style)";
      };

      julia = {
        symbol = " ";
        format = "[$symbol($version )]($style)";
      };

      kotlin = {
        format = "[$symbol($version )]($style)";
        symbol = " ";
      };

      lua = {
        symbol = " ";
        format = "[$symbol($version )]($style)";
      };

      memory_usage = {
        symbol = "󰍛 ";
        format = "$symbol [\${ram}( \\| \${swap})]($style) ";
      };

      openstack = {
        format = "[$symbol$cloud(\\($project\\))]($style) ";
      };

      meson = {
        symbol = "󰔷 ";
        format = "[$symbol$project]($style) ";
      };

      nim = {
        format = "[$symbol($version )]($style)";
        symbol = "󰆥 ";
      };

      nix_shell = {
        format = "[$symbol$state( \\($name\\))]($style) ";
        symbol = " ";
      };

      nodejs = {
        format = "[$symbol($version )]($style)";
        symbol = " ";
      };

      ocaml = {
        format = "[$symbol($version )(\\($switch_indicator$switch_name\\) )]($style)";
        symbol = " ";
      };

      daml = {
        format = "[$symbol($version )]($style)";
      };

      opa = {
        format = "[$symbol($version )]($style)";
      };

      sudo = {
        format = "[$symbol]($style)";
        symbol = " ";
        style = "bold red";
        disabled = false;
      };

      os.disabled = false;
      os.format = "[$symbol ]($style)";

      os.symbols = {
        Alpaquita = " ";
        Alpine = " ";
        Amazon = " ";
        Android = " ";
        Arch = " ";
        Artix = " ";
        CentOS = " ";
        Debian = " ";
        DragonFly = " ";
        Emscripten = " ";
        EndeavourOS = " ";
        Fedora = " ";
        FreeBSD = " ";
        Garuda = "󰛓 ";
        Gentoo = " ";
        HardenedBSD = "󰞌 ";
        Illumos = "󰈸 ";
        Linux = " ";
        Mabox = " ";
        Macos = " ";
        Manjaro = " ";
        Mariner = " ";
        MidnightBSD = " ";
        Mint = " ";
        NetBSD = " ";
        NixOS = "[ ](bold blue)";
        OpenBSD = "󰈺 ";
        openSUSE = " ";
        OracleLinux = "󰌷 ";
        Pop = " ";
        Raspbian = " ";
        Redhat = " ";
        RedHatEnterprise = " ";
        Redox = "󰀘 ";
        Solus = "󰠳 ";
        SUSE = " ";
        Ubuntu = " ";
        Unknown = " ";
        Windows = "󰍲 ";
      };

      terraform = {
        format = "[$symbol$workspace]($style) ";
      };

      package = {
        symbol = "󰏗 ";
        format = "[$symbol$version]($style) ";
      };

      bun = {
        format = "[$symbol($version )]($style)";
      };

      perl = {
        format = "[$symbol($version )]($style)";
        symbol = " ";
      };

      php = {
        format = "[$symbol($version )]($style)";
        symbol = " ";
      };

      pulumi = {
        format = "[$symbol($username)$stack]($style)";
      };

      purescript = {
        format = "[$symbol($version )]($style)";
      };

      pijul_channel = {
        format = "[$symbol$channel]($style) ";
        symbol = " ";
      };

      python = {
        format = "[\${symbol}\${pyenv_prefix}(\${version} )(\\($virtualenv\\) )]($style)";
        symbol = " ";
      };

      rlang = {
        format = "[$symbol($version )]($style)";
        symbol = "󰟔 ";
      };

      raku = {
        format = "[$symbol($version-$vm_version )]($style)";
      };

      red = {
        format = "[$symbol($version )]($style)";
      };

      ruby = {
        symbol = " ";
        format = "[$symbol($version )]($style)";
      };

      rust = {
        format = "[$symbol($version )]($style)";
        symbol = " ";
      };

      scala = {
        format = "[\${symbol}(\${version} )]($style)";
        symbol = " ";
      };

      solidity = {
        format = "[$symbol($version )]($style)";
      };

      spack = {
        format = "[$symbol$environment]($style) ";
      };

      swift = {
        format = "[$symbol($version )]($style)";
        symbol = " ";
      };

      zig = {
        format = "[$symbol($version )]($style)";
        symbol = " ";
      };

      env_var = {
        format = "[$env_value]($style) ";
      };

      palettes.catppuccin_mocha = {
        rosewater = "#f5e0dc";
        flamingo = "#f2cdcd";
        pink = "#f5c2e7";
        mauve = "#cba6f7";
        red = "#f38ba8";
        maroon = "#eba0ac";
        peach = "#fab387";
        yellow = "#f9e2af";
        green = "#a6e3a1";
        teal = "#94e2d5";
        sky = "#89dceb";
        sapphire = "#74c7ec";
        blue = "#89b4fa";
        lavender = "#b4befe";
        text = "#cdd6f4";
        subtext1 = "#bac2de";
        subtext0 = "#a6adc8";
        overlay2 = "#9399b2";
        overlay1 = "#7f849c";
        overlay0 = "#6c7086";
        surface2 = "#585b70";
        surface1 = "#45475a";
        surface0 = "#313244";
        base = "#1e1e2e";
        mantle = "#181825";
        crust = "#11111b";
      };
    };
  };

  systemd.user = {
    enable = true;
    services.dwmblocks.Service = {
      Environment = "PATH=${pkgs.networkmanager}/bun:${pkgs.xorg.setxkbmap}/bin:${pkgs.brightnessctl}/bin:${pkgs.procps}/bin:${pkgs.pamixer}/bin:${pkgs.wirelesstools}/bin:${pkgs.callPackage ./bin/dwm_battery.nix {}}/bin:${pkgs.callPackage ./bin/dwm_brightness.nix {}}/bin:${pkgs.callPackage ./bin/dwm_clock.nix {}}/bin:${pkgs.callPackage ./bin/dwm_cpu_temp.nix {}}/bin:${pkgs.callPackage ./bin/dwm_date.nix {}}/bin:${pkgs.callPackage ./bin/dwm_kernel.nix {}}/bin:${pkgs.callPackage ./bin/dwm_keyboard_layout.nix {}}/bin:${pkgs.callPackage ./bin/dwm_memory.nix {}}/bin:${pkgs.callPackage ./bin/dwm_network.nix {}}/bin:${pkgs.callPackage ./bin/dwm_traffic.nix {}}/bin:${pkgs.callPackage ./bin/dwm_uptime.nix {}}/bin:${pkgs.callPackage ./bin/dwm_volume.nix {}}/bin:${pkgs.busybox}/bin:${pkgs.iproute2}/bin";
      ExecStart = "${lib.getExe dwmBlocks}";
      Restart = "on-failure";
      RestartSec = 3;
    };
  };
}
