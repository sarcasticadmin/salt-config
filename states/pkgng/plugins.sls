pkg_plugins:
  pkg.installed:
    - pkgs:
      - pkg-provides

/usr/local/etc/pkg.conf:
  file.managed:
    - source: salt://{{ tpldir }}/conf/plugins-pkg.conf
    - user: root
    - group: wheel
    - mode: 644
    - require:
      - pkg: pkg_plugins

pkg_provides_update:
  cmd.run:
    - name: pkg provides -u
    - creates: /var/db/pkg/provides/provides.db
    - require:
      - pkg: pkg_plugins
