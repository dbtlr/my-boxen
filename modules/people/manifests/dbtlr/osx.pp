class people::dbtlr::osx {
  include osx::finder::unhide_library
  include osx::no_network_dsstores
  include osx::global::enable_keyboard_control_access
  include osx::global::natural_mouse_scrolling

  class { 'osx::dock::icon_size': 
    size => 28
  }
}