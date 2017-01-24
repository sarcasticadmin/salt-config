/usr/local/share/slim/themes/freebsd:
  file.recurse:
    - source: salt://{{ tpldir }}/themes/freebsd
    - user: root
    - group: wheel
    - file_mode: 644
    - dir_mode: 755
    - makedirs: True
    - recurse:
      - user
      - group
      - mode
    - require:
      - sls: desktop_pkgs

/usr/local/etc/slim.conf:
  file.managed:
    - source: salt://{{ tpldir }}/slim.conf
    - user: root
    - group: wheel
    - mode: 644
    - require:
      - file: /usr/local/share/slim/themes/freebsd
