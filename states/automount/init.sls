automount:
  service.running:
    - reload: False

automountd:
  service.running:
    - reload: False
    - watch:
        - service: automount

autounmountd:
  service.running:
    - reload: False
    - watch:
        - service: automountd

/mnt/nfs:
  file.directory:
    - user: root
    - group: wheel
    - mode: 755
    - makedirs: True

/etc/auto_master:
  file.managed:
    - source: salt://{{ tpldir }}/auto_master
    - user: root
    - group: wheel
    - mode: 644
    - require:
        - file: /mnt/nfs
    - watch_in:
        - service: automount

/etc/auto_nfs:
  file.managed:
    - source: salt://{{ tpldir }}/auto_nfs.jinja
    - template: jinja
    - context:
        mountpoints: {{ salt['pillar.get']('nfs_mountpoints', {}) }}
    - user: root
    - group: wheel
    - mode: 644
    - require:
        - file: /etc/auto_master
    - watch_in:
        - service: automount
