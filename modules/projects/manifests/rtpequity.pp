class projects::rtpequity($dev_email = 'testing+fromdev@rockthepost.com') {
  include php::5_4_17
  include php::fpm::5_4_17
  include php::composer
  include nginx
  include mysql
  include mongodb
  # include memcached
  include redis

  $app_name    = 'rtpequity'
  $php_version = '5.4.17'
  $repo_dir    = "${boxen::config::srcdir}/sites/${app_name}"
  $server_name = 'rockthepost.local'

  php::extension::apc { "apc for ${php_version}":
    php => $php_version
  }

  php::extension::mcrypt { "mcrypt for ${php_version}":
    php => $php_version
  }

  # php::extension::memcached { "memcached for ${php_version}":
  #   php => $php_version
  # }

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

  php::extension::oauth { "oauth for ${php_version}":
    php => $php_version
  }

  host { 'rockthepost.local':
    ip => '127.0.0.1',
  }

  class { 'nodejs::global': version => 'v0.10' }

  nodejs::module { 'grunt':
    node_version => 'v0.10'
  }

  nodejs::module { 'grunt-cli':
    node_version => 'v0.10'
  }

  nodejs::module { 'bower':
    node_version => 'v0.10'
  }

  nodejs::module { 'less':
    node_version => 'v0.10'
  }

  nodejs::module { 'localtunnel':
    node_version => 'v0.10'
  }

  ruby::gem { 'compass for 2.0.0':
    gem     => 'compass',
    ruby    => '2.0.0'
  }

	php::project { $app_name:
    mysql         => ['equity'],
    # memcached     => true,
    nginx         => 'projects/nginx/rtpequity.conf.erb',
    source        => 'RockThePost/Equity',
    server_name   => $server_name,
    php           => $php_version,
    dir           => $repo_dir,
  }

  file { "${boxen::config::srcdir}/sites/${app_name}/src/config/autoload/local.php":
    path    => "${boxen::config::srcdir}/sites/${app_name}/src/config/autoload/local.php",
    require => Repository[$repo_dir],
    content => template("projects/${app_name}/local.php.erb")
  }

  file { "${php::config::configdir}/${php_version}/conf.d/${app_name}.ini":
    path    => "${php::config::configdir}/${php_version}/conf.d/${app_name}.ini",
    content => template("projects/php/${app_name}.ini.erb"),
    require => Php_version[$php_version],
  }

  file { "${boxen::config::configdir}/ssl":
    ensure => 'directory',
  }

  file { "${boxen::config::configdir}/ssl/$server_name.crt":
    require => File["${boxen::config::configdir}/ssl"],
    source  => "puppet:///modules/projects/ssl/$server_name.crt"
  }

  file { "${boxen::config::configdir}/ssl/server.key":
    require => File["${boxen::config::configdir}/ssl"],
    source  => "puppet:///modules/projects/ssl/server.key"
  }

  file { "${boxen::config::configdir}/nginx/sites/${app_name}.ssl.conf":
    path    => "${boxen::config::configdir}/nginx/sites/${app_name}.ssl.conf",
    content => template("projects/nginx/${app_name}.ssl.conf.erb"),
  }
}