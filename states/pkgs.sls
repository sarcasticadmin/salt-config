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
      - newsboat
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

removed_pkgs:
  pkg.removed:
    - pkgs:
      - newsbeuter
    - require:
      - sls: pkgng

# Chrome required sysctl
kern.ipc.shm_allow_removed:
  sysctl.present:
    - value: 1
    - require:
      - pkg: pkg_list
