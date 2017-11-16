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
      - stow
      - py27-virtualenv
      - newsbeuter
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


/etc/sysctl.conf:
  file.managed:
    - source: salt://sysctl.conf
    - user: root
    - group: wheel
    - mode: 644
    - require:
      - pkg: pkg_list
