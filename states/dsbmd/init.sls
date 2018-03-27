include:
  - pkgng

dsbmd:
  pkg.installed: []
  service.running:
    - enable: True
    - require:
      - sls: pkgng

dsbmc-cli:
  pkg.installed:
    - require:
      - pkg: dsbmd

# Enable user media mounting
vfs.usermount:
  sysctl.present:
    - value: 1
