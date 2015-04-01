include tomcat

tomcat::instance {'cas':
  ensure    => present,
  http_port => '8080',
}

class { "maven::maven": }

$certdir = '/etc/ssl'

exec {'create_self_signed_sslcert':
  command => "openssl req -newkey rsa:2048 -nodes -keyout ${::fqdn}.key  -x509 -days 365 -out ${::fqdn}.crt -subj '/CN=${::fqdn}'",
  cwd     => $certdir,
  creates => [ "${certdir}/${::fqdn}.key", "${certdir}/${::fqdn}.crt", ],
  path    => ["/usr/bin", "/usr/sbin"]
}

class { 'nginx': }

nginx::resource::upstream { 'tomcat':
  members => [
    'localhost:8080',
  ],
}

nginx::resource::vhost { 'cas.dev':
  proxy => 'http://tomcat',
  ssl => true,
  ssl_cert => "${certdir}/${::fqdn}.crt",
  ssl_key => "${certdir}/${::fqdn}.key",
}

class { 'firewall': }

firewall { '100 allow http and https access':
    port   => [80, 443, 8080],
    proto  => tcp,
    action => accept,
}

