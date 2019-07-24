drm-kmod:
  pkg.installed: []

kld_list:
  sysrc.managed:
    - value: "/boot/modules/i915kms.ko"
    - require:
      - pkg: drm-kmod
