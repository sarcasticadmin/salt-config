include:
  - .mergemaster
  - .cshrc

# Enable routing
net.inet.ip.forwarding:
  sysctl.present:
    - value: 1
