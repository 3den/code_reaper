# -*- encoding: utf-8 -*-
require File.expand_path('../lib/code_reaper/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Marcelo Eden"]
  gem.email         = ["edendroid@gmail.com"]
  gem.description   = %q{Remove evil tags from your code}
  gem.summary       = %q{Run the method strip to remove unwanted tags from your code}
  gem.homepage      = "https://github.com/3den/code_reaper"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "code_reaper"
  gem.require_paths = ["lib"]
  gem.version       = CodeReaper::VERSION

  gem.add_development_dependency "rake"
end
