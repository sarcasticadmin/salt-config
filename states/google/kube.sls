include:
  - pkgs

kubectl:
  pkg.installed:
    - require:
      - sls: pkgs

helm:
  pkg.installed:
    - require:
      - sls: pkgs
