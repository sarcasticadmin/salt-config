pf:
  service.running:
    - enable: True
  file.managed:
    - name: /etc/pf.conf
    - template: jinja
    - source: salt://{{ tpldir }}/pf.conf.jinja
    - context:
        interfaces: {{ salt['pillar.get']('pf:interfaces', ['re0']) }}
    - listen_in:
      - service: pf
  # This is already set in /etc/defaults/rc.conf
  sysrc.managed:
    - name: pf_rules
    - value: /etc/pf.conf
    - listen_in:
      - service: pf

pflog_enable:
  sysrc.managed:
    - value: "YES"
    - listen_in:
      - service: pf

# This is already set in /etc/defaults/rc.conf
pflog_logfile:
  sysrc.managed:
    - value: "/var/log/pflog"
    - require:
      - sysrc: pflog_enable
    - listen_in:
      - service: pf
