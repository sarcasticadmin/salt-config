include:
  - users

cleanup_downloads:
  cron.present:
    - name: '/usr/bin/find ${HOME}/Downloads/ -depth 1 -mtime +90 -exec rm -rf {} \;'
    - identifier: CLEANUP_DOWNLOADS
    - user: {{ salt['pillar.get']('user:name', 'minion') }}
    - minute: 0
    - hour: 19
    - dayweek: 0
    - require:
      - sls: users 
