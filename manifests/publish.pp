# == Define aptly::publish
#
# Manages the aptly publications (of repos, mirrors and snapshots)
#
define aptly::publish (
  String $source_type,
  Variant[Enum['present', 'absent', 'purged', 'disabled', 'installed', 'latest'], String[1]] $ensure = 'present',
  Integer $uid                  = 450,
  Integer $gid                  = 450,
  String $distribution          = "${facts['os']['distro']['codename']}-${name}",
  String $prefix                = '.',
  Array $architectures          = undef,
  String $label                 = '',
  Boolean $notautomatic         = false,
  Boolean $butautomaticupgrades = false,
) {

  aptly_publish { $name:
    ensure               => $ensure,
    uid                  => $uid,
    gid                  => $gid,
    source_type          => $source_type,
    distribution         => $distribution,
    architectures        => $architectures,
    prefix               => $prefix,
    label                => $label,
    notautomatic         => $notautomatic,
    butautomaticupgrades => $butautomaticupgrades,
    notify               => Class['aptly::service'],
  }
}
