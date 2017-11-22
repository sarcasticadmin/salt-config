{% set hourly_zfs_filesystems = ['zroot/ROOT', 'zroot/usr', 'zroot/var/log'] %}

zfsnap:
  pkg.installed: []

hourly_snapshots:
  cron.present:
    - identifier: 'hourly_zfs_snapshot'
    - name: '/usr/local/sbin/zfSnap -a 2w -r {{ ' '.join(hourly_zfs_filesystems) }}'
    - minute: '15'
    - require:
      - pkg: zfsnap

cleanup_shapshots:
  cron.present:
    - identifier: 'cleanup_zfs_snapshots'
    - name: '/usr/local/sbin/zfSnap -d'
    - minute: '30'
    - hour: '9,18'
    - require:
      - pkg: zfsnap
