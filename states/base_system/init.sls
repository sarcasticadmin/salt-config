include:
  - .mergemaster
  - .cshrc

# Enable routing
net.inet.ip.forwarding:
  sysctl.present:
    - value: 1

# IPv6 on all interfaces
ifconfig_DEFAULT:
  sysrc.managed:
    - value: "accept_rtadv"

ipv6_activate_all:
  sysrc.managed:
    - value: "YES"

rtsold:
  service.running:
    - enable: True
  sysrc.managed:
    - name: rtsold_enable
    - value: "YES"
