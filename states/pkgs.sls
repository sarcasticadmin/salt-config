include:
  - pkgng

pkg_list:
  pkg.installed:
    - pkgs:
      - vim-lite
      - tmux
      - bash
      # Terminal emulator
      - rxvt-unicode
      - git-lite
      - git-lfs
      - stow
      - py27-virtualenv
      - doas
      # latex
      - rubber
      - rsync
      - expect
      - the_silver_searcher
      - py27-iocage
      # Task Spooler
      - ts
    - require:
      - sls: pkgng
