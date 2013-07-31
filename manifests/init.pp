# == Class: freight
#
# Installs freight, "A modern take on the Debian archive"
#
# See https://github.com/rcrowley/freight
#
# === Parameters
#
# [*gpgkey*]
#   The userid of the GPG key you want to use to sign packages
#
# [*varlib*]
#   Where freight stores internal state
#   Defaults to '/var/lib/freight'
#
# [*varcache*]
#   Where freight puts its public repository - this should be your web server's
#   docroot
#   Defaults to '/var/cache/freight'
#
# [*origin*]
#   The (optional, free-text) 'Origin' field of the debian Release file
#   Defaults to 'Freight'
#
# [*label*]
#   The (optional, free-text) 'Label' field of the debian Release file
#   Defaults to 'Freight'
#
# [*cache*]
#   Whether or not to cache the control files after each run. true/false
#   Enabling this leads to a massive increase in speed after your first run.
#   Defaults to true
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
