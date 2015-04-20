Gem::Specification.new do |gem|
  gem.name        = 'seize'
  gem.version     = '0.0.1'
  gem.authors     = ['Felipe Casadei']
  gem.homepage    = 'http://github.com/casadei/seize'

  gem.summary     = 'URL Scrapper'
  gem.description = gem.summary
  gem.license     = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "bundler", "~> 1.3"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "nokogiri"
end
