/usr/local/etc/pkg/repos:
  file.directory:
    - makedirs: True
    - user: root
    - group: wheel
    - mode: 755

{% for repo, repo_attrs in salt['pillar.get']('pkgng:repos', {}) | dictsort %}
/usr/local/etc/pkg/repos/{{ repo }}.conf:
  file.managed:
    - source: salt://{{ tpldir }}/conf/pkg.conf.jinja
    - template: jinja
    - user: root
    - group: wheel
    - mode: 644
    - context:
        repo_name: {{ repo }}
      {% for repo_attr, val in repo_attrs | dictsort %}
        {{ repo_attr }}: {{ val }}
      {% endfor %}
    - require:
      - file: /usr/local/etc/pkg/repos

{% if 'pubkey' in repo_attrs %}
/usr/local/etc/ssl/certs/{{ repo }}.cert:
  file.managed:
    - source: salt://{{ tpldir }}/keys/{{ repo }}.cert
    - user: root
    - group: wheel
    - mode: 644
    - require:
      - file: /usr/local/etc/pkg/repos/{{ repo }}.conf
{% endif %}
{% endfor %}
