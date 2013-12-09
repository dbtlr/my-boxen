class people::dbtlr {
  $home     = "/Users/dbtlr"
  $config   = "${home}/.config"
  $srcdir   = "${boxen::config::srcdir}"

  file { $config:
    ensure  => directory
  }

  # Add git config
  repository { "${srcdir}/git":
    source  => 'https://gist.github.com/7269064.git',
    require => File[$srcdir]
  }

  file { "${home}/.gitconfig":
    ensure  => link,
    target  => "${srcdir}/git/.gitconfig",
    require => Repository["${srcdir}/git"]
  }

  # Add fish-bits.
  repository { "${srcdir}/fish-bits":
    source  => 'git@github.com:dbtlr/fish-bits.git',
    require => File[$srcdir]
  }

  file { "${config}/fish":
    ensure  => link,
    target  => "${srcdir}/fish-bits",
    require => Repository["${srcdir}/fish-bits"]
  }

  include projects::all

  include osx::finder::unhide_library
  include osx::no_network_dsstores
  include osx::global::enable_keyboard_control_access
  include osx::global::natural_mouse_scrolling

  class { 'osx::dock::icon_size': 
    size => 28
  }  
}
