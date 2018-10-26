{% set pool = salt['pillar.get']('iohyve:zpool', 'zpool') %}
{% set net = salt['pillar.get']('iohyve:interface', 're0') %}
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

if_bridge_load:
  sysrc.managed:
    - value: "YES"
    - require:
      - pkg: iohyve
  cmd.run:
    - name: kldload if_bridge
    - onchanges:
      - sysrc: if_tap_load

cloned_interfaces:
  sysrc.managed:
    - value: "bridge0 tap0"
  cmd.run:
    - name: ifconfig tap0  && ifconfig bridge0 create
    - onchanges:
      - sysrc: cloned_interfaces

ifconfig_bridge0:
  sysrc.managed:
    - value: "addm {{ net }} addm tap0"
  cmd.run:
    - name: ifconfig bridge0 addm {{ net }} addm tap0 && ifconfig bridge0 up
    - onchanges:
      - sysrc: cloned_interfaces

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
    - value: "kmod=1 net={{ net }}"
    - require:
      - pkg: iohyve

net.link.tap.up_on_open:
  sysctl.present:
    - value: 1
    - require:
      - sysrc: if_tap_load

{{ pool }}/iohyve:
  zfs.filesystem_present:
    - properties:
        mountpoint: '/iohyve'
        compression: lz4

{{ pool }}/iohyve/Firmware:
  zfs.filesystem_present:
    - require:
      - zfs: {{ pool }}/iohyve

{{ pool }}/iohyve/ISO:
  zfs.filesystem_present:
    - require:
      - zfs: {{ pool }}/iohyve
