class people::dbtlr {
  include phpstorm
  include spotify
  include vlc
  include iterm2::stable
  include dropbox
  include flux

  include people::dbtlr::config
  include people::dbtlr::osx
  include people::dbtlr::sublime
  include people::dbtlr::packages

  class { 'projects::rtpequity': 
    dev_email => 'drew+dev-test@rockthepost.com'
  }

  include projects::dbtlr
  include projects::logbandit
  include projects::rtpblog

  nodejs::module { 'express':
    node_version => 'v0.10'
  }

  include go

  go::version { '1.1.1': }

  include go::1_1
}
