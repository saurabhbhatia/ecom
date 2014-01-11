$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ecom/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ecom"
  s.version     = Ecom::VERSION
  s.authors     = ["Saurabh Bhatia"]
  s.email       = ["saurabh.a.bhatia@gmail.com"]
  s.homepage    = "http://fedible.org"
  s.summary     = "A Complete Ecommerce Application"
  s.description = "A Rails plugin to create an Ecommerce Application"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.2"
  s.add_dependency "jquery-rails", "~> 3.0.4"
  s.add_dependency "jquery-ui-rails", "~> 4.1.1"
  s.add_dependency "sass-rails", ">= 3.2"
end
