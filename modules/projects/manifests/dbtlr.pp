class projects::dbtlr {
  $repo_dir    = "${boxen::config::srcdir}/sites/dbtlr"

  nodejs::module { 'coffee-script':
    node_version => 'v0.10'
  }

  boxen::project { 'dbtlr':
    ruby          => '2.1.0',
    source        => 'dbtlr/dbtlr.com',
    dir           => $repo_dir,
  }
}