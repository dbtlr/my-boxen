class people::dbtlr {
  include phpstorm
  include spotify
  include vlc
  include iterm2::stable
  include dropbox
  include flux
  include php::5_4_17

  class { 'php::global':
    version => $php_version
  }


  include people::dbtlr::config
  include people::dbtlr::osx
  include people::dbtlr::sublime
  include people::dbtlr::packages

  class { 'projects::rtpequity': 
    dev_email => 'drew+dev-test@rockthepost.com'
  }

  include projects::dbtlr
  include projects::rtpblog
}
