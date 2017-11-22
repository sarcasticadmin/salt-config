ntpd:
  service.dead:
    - enable: False

openntpd:
  pkg.installed: []
  service.running:
    - enable: True
    - require:
      - pkg: openntpd
      - service: ntpd
  
/usr/local/etc/ntpd.conf:
  file.managed:
    - source: salt://{{ tpldir }}/ntpd.conf
    - user: root
    - group: wheel
    - mode: 644
    - listen_in:
      - service: openntpd
