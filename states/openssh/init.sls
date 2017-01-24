sshd:
{% if salt['pillar.get']('sshd:running', False) %}
  service.running:
    - enable: True
  file.managed:
    - name: /etc/ssh/sshd_config
    - source: salt://{{ tpldir }}/sshd_config
    - listen_in:
      - service: sshd
  sysrc.managed:
    - name: sshd_flags
    - value: "-4"
    - listen_in:
      - service: sshd
{% else %}
  service.dead:
    - enable: False
{% endif %}
