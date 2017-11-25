/etc/mergemaster.rc:
  file.managed:
    - source: salt://{{tpldir}}/configs/mergemaster.rc
    - mode: 640
    - user: root
    - group: wheel
