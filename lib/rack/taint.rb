module Rack
  class Taint

    def initialize(app)
      @app = app
    end

    def call(env)
      dup._call(env)
    end

    def _call(env)
      env.each do |k, v|
        v.taint unless k.include?('.')
      end
      input = env['rack.input'].taint
      if input.respond_to?(:string)
        require 'rack/taint/readable'
        input.extend(Readable).string.taint
      end
      # Some middleware (e.g., Rack::MethodOverride) may cause parameter
      # parsing before we taint.
      env.delete('rack.request.form_input')
      env.delete('rack.request.query_string')
      @app.call(env)
    end

  end
end
