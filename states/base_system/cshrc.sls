/etc/csh.cshrc:
  file.managed:
    - source: salt://{{tpldir}}/configs/csh.cshrc
    - mode: 644
    - user: root
    - group: wheel
