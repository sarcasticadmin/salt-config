# Depends on https://github.com/saltstack/salt/pull/45730
{#{% set iohyve_bool = salt['state.exists']('iohyve') %}#}
{% set iohyve_bool = pillar['iohyve'] is defined %}
pf:
  service.running:
    - enable: True
  file.managed:
    - name: /etc/pf.conf
    - template: jinja
    - source: salt://{{ tpldir }}/pf.conf.jinja
    - context:
        interfaces: {{ salt['pillar.get']('pf:interfaces', ['re0']) }}
        iohyve_bool: {{ iohyve_bool }}
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
