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
      - git
      - git-lfs
      - stow
      - py27-virtualenv
      - doas
      # latex
      - rubber
      - rsync
      - expect
      - the_silver_searcher
      # Task Spooler
      - ts
      - tree
      - jq
    - require:
      - sls: pkgng
      - pkg: removed_pkgs

removed_pkgs:
  pkg.removed:
    - pkgs:
      - git-lite
      - py27-iocage
    - require:
      - sls: pkgng
