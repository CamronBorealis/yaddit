# This file is used by Rack-based servers to start the application.

WEBSITE_SUBDIR = '../delivery/rails_app'
require ::File.expand_path('#{WEBSITE_SUBDIR}/config/environment',  __FILE__)
run RailsApp::Application
