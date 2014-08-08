include tomcat
tomcat::instance {'cas':
  ensure    => present,
  http_port => '8080',
}

class { "maven::maven": }

class { 'firewall': }


firewall { '100 allow http and https access':
    port   => [8080],
    proto  => tcp,
    action => accept,
}

