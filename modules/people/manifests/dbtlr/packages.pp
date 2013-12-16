class people::dbtlr::packages {
	require php
	$composer = "${php::config::root}/bin/composer"

	exec { 'update-composer':
		require => Exec['download-php-composer'],
		command => "$composer self-update"
	}

	exec { 'install-phpunit':
		require => Exec['update-composer'],
		command => "$composer global require 'phpunit/phpunit=3.7.*'"
	}

	exec { 'install-php-code-sniffer':
		require => Exec['update-composer'],
		command => "$composer global require 'squizlabs/php_codesniffer=*'"
	}

	exec { 'install-phpmd':
		require => Exec['update-composer'],
		command => "$composer global require 'phpmd/phpmd=1.4.*'"
	}

	exec { 'install-phing':
		require => Exec['update-composer'],
		command => "$composer global require 'phing/phing=2.6.*'"
	}
}
