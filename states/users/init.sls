include:
  - pkgs

{{ salt['pillar.get']('user:name', 'minion') }}:
  user.present:
    - fullname: {{ salt['pillar.get']('user:fullname', None) }}
    - shell: {{ salt['pillar.get']('user:shell', '/bin/csh') }}
    - home: /home/{{ salt['pillar.get']('user:name', 'minion') }}
    - uid: 1001
    - gid_from_name: True
    - groups:
      - wheel
      - operator
      - video
      - uucp # For serial
    - require:
      - sls: pkgs
