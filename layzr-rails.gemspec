$:.push File.expand_path("../lib", __FILE__)
require "layzr-rails/version"

Gem::Specification.new do |gem|
  gem.name = "layzr-rails"
  gem.version = Layzr::Rails::VERSION
  gem.summary = "Layzr JS Wrapper for Rails image_tag helpers"
  gem.description = "layzr-rails project integrates Layzr JS for Rails image_tag helpers"
  gem.license = "MIT"

  gem.files = Dir["README.md", "MIT-LICENSE", "lib/**/*.rb"]

  gem.add_dependency "nokogiri", "~> 1.5"
  gem.add_development_dependency "actionpack", ">= 3.1"

  gem.author = "Mohit Jain"
  gem.email  = "jain.mohit27@gmail.com"
  gem.homepage = "https://github.com/mohitjain/layzr-rails"
end
