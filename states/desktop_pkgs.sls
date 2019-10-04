include:
    - pkgng
    - pkgs

desktop_pkgs:
  pkg.installed:
    - pkgs:
      - xorg-server
      - hal
      - dbus
      - xinit
      - xorg-drivers
      - i3
      - i3status
      - i3lock
      - dmenu
      - feh
      - slim
      - xosd
      - mons # Finally!
      # Browsers
      - firefox
      - chromium
      # GTK manipulation
      - lxappearance
      - gtk-engines2
      - gtk-murrine-engine
      - mpv
      # Screen capture
      - scrot
      # Image viewer
      - viewnior
      # Picture stuff
      - ImageMagick7
      - darktable
      - ufraw
      # PDF Viewer
      - zathura
      - zathura-pdf-poppler
      - xrandr
      - xwd # Wont need after bug fix
      - exfat-utils
      - en-hunspell
      - newsboat
      # Fonts
      - emojione-color-font-ttf
      - weechat
      - hs-ShellCheck
      - graphviz
      - libqrencode
      - gomplate
      - hub
    - require:
      - sls: pkgs
      - pkg: removed_desktop_pkgs

# Chromium required sysctl
kern.ipc.shm_allow_removed:
  sysctl.present:
    - value: 1
    - require:
      - pkg: desktop_pkgs


removed_desktop_pkgs:
  pkg.removed:
    - pkgs:
      - newsbeuter  # Moving to newsboat
      - xpdf  # xpdf 4.x requires qt5, staying on xpdf3
      - xpdf3 # Found a better alternative in zathura
      # moving away from claws-mail client
      - claws-mail
      - claws-mail-fancy
      - claws-mail-archiver
      # remove Term session recording
      - ttygif
      - ttyrec
    - require:
      - sls: pkgng


# Enable X and i3
dbus:
  service.running:
    - enable: True
    - listen_in:
      - pkg: desktop_pkgs

hald:
  service.running:
    - enable: True
    - listen_in:
      - pkg: desktop_pkgs

slim:
  service.running:
    - enable: True
    - listen_in:
      - pkg: desktop_pkgs
