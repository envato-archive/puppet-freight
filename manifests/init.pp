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
) {

  # validate parameters here

  class { 'freight::package': } ->
  class { 'freight::config': } ~>
  class { 'freight::service': } ->
  Class['freight']
}
