pkgng:
  repos:
    FreeBSD:
      url: "pkg+http://pkg.FreeBSD.org/${ABI}/latest"
      mirror_type: "srv"
      signature_type: "fingerprints"
      fingerprints: "/usr/share/keys/pkg"
      enabled: "'yes'"
      priority: 0
