{% set terraform_version = '0.6.15' %}
/usr/local/stow/terraform_{{ terraform_version }}:
  file.directory:
    - user: root
    - group: wheel
    - mode: 755
    - makedirs: True
    - recurse:
      - user
      - group
      - mode
 
terraform_{{ terraform_version }}:
  archive.extracted:
    - name: /usr/local/stow/terraform_{{ terraform_version }}/bin
    - user: root
    - group: root
    - source: https://releases.hashicorp.com/terraform/{{ terraform_version }}/terraform_{{ terraform_version }}_freebsd_amd64.zip
    - source_hash: sha256=a00ff5f5246326f80603348df578abe48327b05bf2477b08d49967e011a2ddd8
    - archive_format: zip
    - require:
      - file: /usr/local/stow/terraform_{{ terraform_version }}
