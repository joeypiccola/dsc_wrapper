# dsc_wrapper/manifests/init.pp
# there is also before

class dsc_wrapper (
  $server = ['joey','erin']
)
{
  service { 'BITS':
    ensure  => running,
  }

  file { 'c:/tmp/oi':
    ensure  => file,
    require => Package['atom'],
    notify  => Service['BITS'],
    content => epp('dsc_wrapper/oi.txt.epp'),
  }

  package { 'atom':
    ensure   => latest,
    provider => 'chocolatey',
  }
}
