require "rack/taint"

if defined?(Rails::Railtie)
  require 'rack/taint/railtie'
end
