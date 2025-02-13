{ pkgs, ... }:
let
  picomOverlay = pkgs.picom.overrideAttrs (old: {
    version = "git"; # usually harmless to omit
    src = pkgs.fetchFromGitHub {
      owner = "fdev31";
      repo = "picom";
      rev = "7834dd3147ba605bba5cbe911bacfa8b217c37e0";
      sha256 = "sha256-fTMA4LgQ5aw4hnrKSIu74jxYDZpCgj0GmRZtOqQfjRU=";
    };
    nativeBuildInputs = [ pkgs.asciidoc ] ++ old.nativeBuildInputs;
  });
in
{
  services.picom = {
    enable = true;
    package = picomOverlay;
    settings = {
      animations = true;
      animation-stiffness-in-tag = 125;
      animation-stiffness-tag-change = 90.0;
      animation-window-mass = 0.4;
      animation-dampening = 15;
      animation-clamping = true;
      animation-for-open-window = "zoom";
      animation-for-unmap-window = "squeeze";
      animation-for-transient-window = "slide-up";
      animation-for-prev-tag = "minimize";
      enable-fading-prev-tag = true;
      animation-for-next-tag = "slide-in-center";
      enable-fading-next-tag = true;

      shadow = false;
      shadow-radius = 60;
      shadow-offset-x = -20;
      shadow-offset-y = -20;

      fading = true;
      fade-in-step = 0.8;
      fade-out-step = 0.8;
      fade-delta = 10;

      corner-radius = 10;

      blur-method = "dual_kawase";
      blur-strength = 7;
      blur-background = true;
      blur-background-frame = false;
      blur-background-fixed = false;

      backend = "glx";
      dithered-present = false;
      mark-wmwin-focused = true;
      mark-ovredir-focused = true;
      detect-rounded-corners = false;
      detect-client-opacity = false;
      use-ewmh-active-win = true;
      unredir-if-possible = false;
      detect-transient = true;

      glx-no-stencil = true;
      use-damage = true;
      xrender-sync-fence = true;
      window-shader-fg = "default";
      transparent-clipping = false;

      log-level = "warn";
    };
  };
}

