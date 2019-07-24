py27-salt:
  pkg.installed: []
  service.dead:
    - name: salt-minion

/usr/local/etc/salt/minion.d:
  file.directory:
    - user: root
    - group: wheel
    - mode: 755
    - require:
      - pkg: py27-salt

/usr/local/etc/salt/minion.d/99-tweaks.conf:
  file.managed:
    - contents: |
        file_client: local
    - user: root
    - group: wheel
    - mode: 644
    - require:
      - file: /usr/local/etc/salt/minion.d
