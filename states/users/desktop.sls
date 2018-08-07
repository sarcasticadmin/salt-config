include:
  - users

cleanup_downloads:
  cron.present:
    - name: '/usr/bin/find ${HOME}/Downloads/ -mtime +90 -exec rm -f {} \;'
    - user: {{ salt['pillar.get']('user:name', 'minion') }}
    - minute: 0
    - hour: 19
    - dayweek: 0
    - require:
      - sls: users 
