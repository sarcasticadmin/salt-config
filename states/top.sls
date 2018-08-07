base:
  '*':
    - base_system
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
    - zfsnap
    - dsbmd
  'robs-desktop':
    - users.desktop
    - gnupg
    - ruby
    - golang
  'robs-laptop':
    - users.desktop
    - gnupg
    - iohyve
    - ruby
    - golang
