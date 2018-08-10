include:
  - pkgs

google-cloud-sdk:
  pkg.installed:
    - require:
      - sls: pkgs

