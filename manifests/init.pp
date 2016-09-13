# dsc_wrapper/manifests/init.pp
# there is also before 

class dsc_wrapper {


  service { 'BITS':
    ensure  => 'Started',
    enabled => true,
  }

  file { 'c:/tmp/oi':
    ensure  => file,
    require => Package['atom'],
    notify  => Service['BITS'],
    source  => 'puppet:///modules/dsc_wrapper/files/oi.txt',
  }

  package { 'atom':
    ensure   => latest,
    provider => 'chocolatey',
  }
}