include:
  - pkgs
  - users

{% set user = salt['pillar.get']('user:name', 'minion') %}

/usr/home/{{ user }}/.virtualenvs:
  file.directory:
    - user: {{ user }}
    - group: {{ user }}
    - mode: 755

/usr/home/{{ user }}/.virtualenvs/default:
  virtualenv.managed:
    - system_site_packages: False
    - user: {{ user }}
    - pip_pkgs:
      - awscli
    - require:
      - pkg: pkg_list
      - file: /usr/home/{{ user }}/.virtualenvs
      - user: {{ user }}
