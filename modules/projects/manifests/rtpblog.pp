class projects::rtpblog {
  include php::5_4_17
  include php::fpm::5_4_17
  include nginx
  include memcached

  $app_name    = 'rtpblog'
  $php_version = '5.4.17'
  $repo_dir    = "${boxen::config::srcdir}/sites/${app_name}"
  $server_name = 'blog.rockthepost.local'

  host { 'blog.rockthepost.local':
    ip => '127.0.0.1',
  }

  php::project { $app_name:
    mysql         => ['blog'],
    nginx         => true,
    memcached     => true,
    source        => 'RockThePost/RTP-blog',
    server_name   => $server_name,
    php           => $php_version,
    dir           => $repo_dir,
  }
}
