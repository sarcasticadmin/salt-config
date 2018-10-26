include:
  - .nitrokey

gnupg:
  pkg.installed: []

pcsc-lite:
  pkg.installed: []
  service.running:
    - name: pcscd
    - enable: True
    - require:
      - pkg: pcsc-lite

# Driver for smartcard:
# /usr/local/lib/pcsc/drivers/ifd-ccid.bundle/Contents/Info.plist
ccid:
  pkg.installed: []
