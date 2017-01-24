/etc/pkg/FreeBSD.conf:
  file.managed:
    - source: salt://{{ tpldir }}/FreeBSD.conf
    - user: root
    - group: wheel
    - mode: 644
