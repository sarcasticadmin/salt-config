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
    - intel
    - users.desktop
    - gnupg
    - ruby
    - golang
    - google.kube
    - google.sdk
    - iohyve
  'robs-laptop':
    - intel
    - users.desktop
    - gnupg
    - iohyve
    - ruby
    - golang
    - google.kube
    - google.sdk
