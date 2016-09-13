# dsc_wrapper/manifests/init.pp
# there is also before 

class dsc_wrapper {


  $server1 = '1.1.1.1'
  $server2 = '2.2.2.2'

  service { 'BITS':
    ensure  => running,
  }

  file { 'c:/tmp/oi':
    ensure  => file,
    require => Package['atom'],
    notify  => Service['BITS'],
    content => template('dsc_wrapper/oi.txt.epp'),
  }

  package { 'atom':
    ensure   => latest,
    provider => 'chocolatey',
  }
}