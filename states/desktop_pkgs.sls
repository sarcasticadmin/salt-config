include:
    - pkgng

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
      - ImageMagick
      - darktable
      - ufraw
      - xpdf3
      - xrandr
      # Term session recording
      - xwd # Wont need after bug fix
      - ttygif
      - ttyrec
      - exfat-utils
      # mail client
      - claws-mail
      - claws-mail-fancy
      - claws-mail-archiver
      - en-hunspell
      - newsboat
      # Fonts
      - emojione-color-font-ttf
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
