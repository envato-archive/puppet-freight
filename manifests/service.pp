# == Class freight::service
#
# This class is meant to be called from freight
# It ensure the service is running
#
class freight::service {
  service { 'freight':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
