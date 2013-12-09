class people::dbtlr::config {
  include fish

  $home     = "/Users/dbtlr"
  $config   = "${home}/.config"
  $srcdir   = "${boxen::config::srcdir}"

  file { $config:
    ensure  => directory
  }

  # Add git config
  repository { "${srcdir}/config/git":
    source  => 'https://gist.github.com/7269064.git',
    require => File[$srcdir]
  }

  file { "${home}/.gitconfig":
    ensure  => link,
    target  => "${srcdir}/config/git/.gitconfig",
    require => Repository["${srcdir}/config/git"]
  }

  # Add fish-bits.
  repository { "${srcdir}/config/fish-bits":
    source  => 'git@github.com:dbtlr/fish-bits.git',
    require => File[$srcdir]
  }

  file { "${config}/fish":
    ensure  => link,
    target  => "${srcdir}/config/fish-bits",
    require => Repository["${srcdir}/config/fish-bits"]
  }
}