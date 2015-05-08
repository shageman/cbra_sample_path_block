$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "a/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "a"
  s.version     = A::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of A."
  s.description = "TODO: Description of A."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.9"
  s.add_dependency "b"
  
  s.add_development_dependency "sqlite3"
end
