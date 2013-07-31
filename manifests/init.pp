# == Class: freight
#
# Full description of class freight here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class freight (
  $gpgkey,
  $varlib   = '/var/lib/freight',
  $varcache = '/var/cache/freight',
  $origin   = 'Freight',
  $label    = 'Freight',
  $cache    = true,
) {

  # validate parameters here

  class { 'freight::package': } ->
  class { 'freight::config':
    gpgkey => $gpgkey,
    varlib => $varlib,
    varcache => $varcache,
    origin => $origin,
    label => $label,
    cache => $cache,
  } ~>
  Class['freight']
}
