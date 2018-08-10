include:
  - pkgs

kubectl:
  pkg.installed:
    - require:
      - sls: pkgs
