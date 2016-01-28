# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_youtube_embed'
  s.version     = '3.0.4'
  s.summary     = ''
  s.description = 'Add youtube video links acting as if it were product images trough embedding'
  s.required_ruby_version = '>= 2.0.0'

  s.author    = 'Fernando Bellincanta'
  s.email     = 'ervalhous@hotmail.com'
  # s.homepage  = 'http://www.spreecommerce.com'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_api'
  s.add_dependency 'spree_backend', '~> 3.0'
  s.add_dependency 'spree_core', '~> 3.0'
  s.add_dependency 'spree_frontend'

end
