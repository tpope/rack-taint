module Rack
  class Taint
    class Railtie < Rails::Railtie
      initializer 'rack.taint.configure_rails_initialization' do |app|
        app.middleware.insert_before(Rack::Runtime, Rack::Taint)
      end
    end
  end
end
