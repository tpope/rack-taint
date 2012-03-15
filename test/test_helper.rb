require 'bundler'
Bundler.setup

require 'minitest/autorun'
require 'stringio'
require 'rack/taint'

class MiniTest::Unit::TestCase
  def app
    Rack::Taint.new(lambda { |env| env })
  end

  def assert_tainted(obj, msg = nil)
    msg = message(msg) { "Expected #{mu_pp(obj)} to be tainted" }
    assert obj.tainted?, msg
  end

  def refute_tainted(obj, msg = nil)
    msg = message(msg) { "Expected #{mu_pp(obj)} to not be tainted" }
    refute obj.tainted?, msg
  end
end
