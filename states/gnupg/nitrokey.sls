include:
  - base_system

/usr/local/etc/devd/nitrokey.conf:
  file.managed:
    - source: salt://{{ tpldir }}/devfs/nitrokey.conf
    - listen_in:
      - service: devfs
