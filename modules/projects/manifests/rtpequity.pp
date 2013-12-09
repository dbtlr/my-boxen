class projects::rtpequity {
  include php::5_4_17
  include php::fpm::5_4_17
  include php::composer
  include nginx
  include zookeeper

  $app_name    = 'rtpequity'
  $php_version = '5.4.17'

  class { 'php::global':
    version => $php_version
  }

  php::extension::apc { "apc for ${php_version}":
    php => $php_version
  }

  php::extension::mcrypt { "mcrypt for ${php_version}":
    php => $php_version
  }

  php::extension::imagick { "imagick for ${php_version}":
    php     => $php_version,
    version => '3.2.0RC1',
  }

  php::extension::xdebug { "xdebug for ${php_version}":
    php => $php_version
  }

  php::extension::pecl_http { "pecl_http for ${php_version}":
    php => $php_version
  }

  php::extension::intl { "intl for ${php_version}":
    php => $php_version
  }

  host { 'rockthepost.local':
    ip => '127.0.0.1',
  }

  nodejs::module { 'grunt-cli':
    node_version => 'v0.10'
  }

  nodejs::module { 'bower':
    node_version => 'v0.10'
  }

	php::project { $app_name:
    mysql         => ['equity'],
    nginx         => 'projects/nginx/rtpequity.conf.erb',
    memcached     => true,
    source        => 'RockThePost/Equity',
    server_name   => 'rockthepost.local',
    php           => $php_version,
  }
}