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
      - xpdf
      - xrandr
      # Term session recording
      - xwd # Wont need after bug fix
      - ttygif
      - ttyrec
      - exfat-utils
    - require:
      - sls: pkgs

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
