# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.authors       = ["Tim Pope"]
  gem.email         = ["code@tpope.net"]
  gem.summary       = %q{Rack middleware to taint incoming data}
  gem.homepage      = "https://github.com/tpope/rack-taint"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "rack-taint"
  gem.require_paths = ["lib"]
  gem.version       = '1.0.0'
  gem.add_development_dependency 'minitest'
  gem.add_development_dependency 'rack'
end
