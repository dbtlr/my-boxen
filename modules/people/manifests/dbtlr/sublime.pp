class people::dbtlr::sublime {
  include sublime_text_3
  include sublime_text_3::package_control

  sublime_text_3::package { 'phpcs':
    source => 'benmatselby/sublime-phpcs'
  }

  sublime_text_3::package { 'fish-shell':
    source => 'toru-hamaguchi/sublime-fish-shell'
  }

  sublime_text_3::package { 'puppet':
    source => 'russCloak/SublimePuppet'
  }

  sublime_text_3::package { 'ini':
    source => 'clintberry/sublime-text-2-ini'
  }

  sublime_text_3::package { 'vagrant':
    source => 'Stubbs/sublime-vagrant'
  }

  sublime_text_3::package { 'git-config':
    source => 'robballou/gitconfig-sublimetext'
  }

  sublime_text_3::package { 'php-twig':
    source => 'Anomareh/PHP-Twig.tmbundle'
  }

  sublime_text_3::package { 'php-syntax-checker':
    source => 'naomichi-y/php_syntax_checker'
  }

  sublime_text_3::package { 'phpcs':
    source => 'benmatselby/sublime-phpcs'
  }

  sublime_text_3::package { 'DocBlockr':
    source => 'spadgos/sublime-jsdocs'
  }

  sublime_text_3::package { 'sass':
    source => 'nathos/sass-textmate-bundle'
  }

  sublime_text_3::package { 'nginx':
    source => 'brandonwamboldt/sublime-nginx'
  }

  sublime_text_3::package { 'IndentXml':
    source => 'alek-sys/sublimetext_indentxml'
  }
}
