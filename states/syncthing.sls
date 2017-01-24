syncthing:
  pkg.latest:
    - require:
      - sls: pkgs
{% if salt['pillar.get']('sycnthing:running', False) %}
  service.running:
    - enable: True
{% else %}
  service.dead:
    - enable: False
{% endif %}
    - require:
      - pkg: syncthing

syncthing_user:
  sysrc.managed:
    - value: {{ salt['pillar.get']('user:name', 'root') }}
    - listen_in:
      - service: syncthing

syncthing_group:
  sysrc.managed:
    - value: 'wheel'
    - listen_in:
      - service: syncthing
