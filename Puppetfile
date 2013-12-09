# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod name, :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.3.4"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "dnsmasq",    "1.0.0"
github "foreman",    "1.0.0"
github "gcc",        "2.0.1"
github "git",        "1.2.5"
github "go",         "1.0.0"
github "homebrew",   "1.5.1"
github "inifile",    "1.0.0", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",      "1.4.2"
github "nodejs",     "3.3.0"
github "openssl",    "1.0.0"
github "phantomjs",  "2.0.2"
github "pkgconfig",  "1.0.0"
github "repository", "2.2.0"
github "ruby",       "6.7.2"
github "stdlib",     "4.1.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",       "1.0.0"
github "xquartz",    "1.1.0"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "chrome",      "1.1.2"
github "fish",        "1.0.0"
github "iterm2",      "1.0.4"
github "dropbox",     "1.1.2"
github "firefox",     "1.1.5"
github "flux",        "1.0.0"
github "gh",          "1.4.1"
github "imagemagick", "1.2.0"
github "sysctl",      "1.0.0"
github "mysql",       "1.1.5"
github "memcached",   "1.2.0"
github "mongodb",     "1.0.5"
github "onepassword", "1.0.2"
github "pgadmin3",    "1.0.0"
github "osx",         "2.1.0"
github "php",         "1.1.4", :repo => "dbtlr/puppet-php"
github "phpstorm",    "1.0.4"
github "postgresql",  "2.0.1"
github "redis",       "2.0.0"
github "screen",      "0.0.2"
github "sequel_pro",  "1.0.1"
github "skitch",      "1.0.2"
github "skype",       "1.0.7"
github "spotify",     "1.0.1"
github "vlc",         "1.0.5"
github "virtualbox",  "1.0.9"
github "wget",        "1.0.0"
github "autoconf",    "1.0.0"
github "libtool",     "1.0.0"
github "pcre",        "1.0.0"
github "libpng",      "1.0.0"

github "sublime_text_3", "1.0.1", :repo => "jozefizso/puppet-sublime_text_3"


