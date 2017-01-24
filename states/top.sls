base:
  '*':
    - zfs
    - pf
    - pkgs
    - salt
    - desktop_pkgs
    - doas
    - users
    - slim
    - automount
    - openntp
    - openssh
    - syncthing
    - virtualenvs
  'robs-desktop':
    # Because I need to build my own gnupg pkg
    - gnupg
