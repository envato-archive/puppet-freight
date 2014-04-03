# == Class freight::package
#
class freight::package {
  apt::source { 'rcrowley':
    location    => 'http://packages.rcrowley.org/',
    release     => $::lsbdistcodename,
    repos       => 'main',
    key         => '7DF49CEF',
    key_source  => 'http://packages.rcrowley.org/keyring.gpg',
    include_src => false,
  }

  package { 'freight':
    require => Apt::Source['rcrowley'],
  }
}
