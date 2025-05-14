require_relative 'lib/omniauth-reddit-oauth2/version'

Gem::Specification.new do |gem|
  gem.name          = 'omniauth-reddit-oauth2'
  gem.version       = OmniAuthRedditOauth2::VERSION
  gem.license       = 'MIT'
  gem.summary       = %(A Reddit Advertising API OAuth2 strategy for OmniAuth)
  gem.description   = %(A Reddit Advertising API OAuth2 strategy for OmniAuth. This allows you to login with Reddit in your ruby app.)
  gem.authors       = ['Martin Ahlberger']
  gem.homepage      = 'https://github.com/burtcorp/omniauth-reddit-oauth2'

  gem.files         = `git ls-files`.split("\n")
  gem.require_paths = ['lib']

  gem.add_runtime_dependency 'omniauth-oauth2', '~> 1.8'
  gem.add_runtime_dependency 'oauth2', '>= 2.0.7'
end
