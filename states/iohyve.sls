iohyve:
  pkg.installed: []

grub2-bhyve:
  pkg.installed:
    - require:
      - pkg: iohyve

if_tap_load:
  sysrc.managed:
    - value: "YES"
    - require:
      - pkg: iohyve
  cmd.run:
    - name: kldload if_tap
    - onchanges:
      - sysrc: if_tap_load

vmm_load:
  sysrc.managed:
    - value: "YES"
    - require:
      - pkg: iohyve
  cmd.run:
    - name: kldload vmm
    - onchanges:
      - sysrc: vmm_load

# Better console to vm
nmdm_load:
  sysrc.managed:
    - value: "YES"
    - require:
      - pkg: iohyve
  cmd.run:
    - name: kldload nmdm
    - onchanges:
      - sysrc: nmdm_load


iohyve_enable:
  sysrc.managed:
    - value: "YES"
    - require:
      - pkg: iohyve

iohyve_flags:
  sysrc.managed:
    - value: "kmod=1 net={{ salt['pillar.get']('iohyve:interface', 're0') }}"
    - require:
      - pkg: iohyve

net.link.tap.up_on_open:
  sysctl.present:
    - value: 1
    - require:
      - sysrc: if_tap_load
