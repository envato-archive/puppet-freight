# == Class freight::config
#
# This class is called from freight
#
class freight::config(
  $gpgkey,
  $varlib   = '/var/lib/freight',
  $varcache = '/var/cache/freight',
  $origin   = 'Freight',
  $label    = 'Freight',
  $cache    = true,
) {

  $cache_on_or_off = $cache ? {
    /^(on|off)$/ => $cache,
    true         => 'on',
    default      => 'off',
  }

  file { '/etc/freight.conf':
    owner   => 'root',
    group   => 'root',
    content => template('freight/freight.conf.erb'),
    mode    => '0644',
  }

}
