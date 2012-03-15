require File.expand_path('../test_helper.rb', __FILE__)

class RackTaintTest < MiniTest::Unit::TestCase

  def test_skip_dotted
    env = app.call(
      'QUERY_STRING' => 'a=1&b=2',
      'rack.url_scheme' => 'http'
    )
    assert_tainted env['QUERY_STRING']
    refute_tainted env['rack.url_scheme']
  end

  def test_input
    env = app.call('rack.input' => StringIO.new)
    assert_tainted env['rack.input'].read
  end

  def test_integration
    require 'rack/request'
    request = Rack::Request.new(app.call(
      'QUERY_STRING' => 'get=1',
      'CONTENT_TYPE' => 'application/x-www-form-urlencoded',
      'rack.input' => StringIO.new('post[nested][]=2')
    ))
    assert_tainted request.GET['get']
    assert_tainted request.POST['post']['nested'].first
  end

end
