class projects::logbandit {
  include mongodb

  $repo_dir    = "${boxen::config::srcdir}/sites/logbandit"

  boxen::project { 'logbandit':
    dir         => $repo_dir,
    mongodb     => true,
    nodejs      => 'v0.10',
    source      => 'dbtlr/logbandit',
    server_name => 'logbandit.local'
  }
}
