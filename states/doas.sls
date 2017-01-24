/usr/local/etc/doas.conf:
  file.managed:
    - contents: |
        permit nopass keepenv { PS1 SSH_AUTH_SOCK } :wheel
    - mode: 600
    - user: root
    - group: wheel
    - require:
      - pkg: pkg_list
