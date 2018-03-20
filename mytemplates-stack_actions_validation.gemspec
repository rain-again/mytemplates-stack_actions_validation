
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "mytemplates/stack_actions_validation/version"

Gem::Specification.new do |s|
  s.name          = "mytemplates-stack_actions_validation"
  s.version       = Mytemplates::StackActionsValidation::VERSION
  s.authors       = ["Krishnan"]
  s.email         = ["km@krishnanm.com"]

  s.summary       = %q{Validate information supplied to operate on stacks in AWS CloudFormation}
  s.description   = %q{When creating, updating, or otherwise changing stacks in AWS CloudFormation, one must supply information such as the stack name, a list of parameters, and so on. This gem helps validate the information against the requirements of the corresponding API actions}
  s.homepage      = "http://mytemplat.es"

  s.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  s.require_paths = ["lib"]

  s.add_dependency "json-schema", "~> 2.8"

  s.add_development_dependency "bundler", "~> 1.16"
  s.add_development_dependency "rake", "~> 12.3"
  s.add_development_dependency "rspec", "~> 3.7"
  s.add_development_dependency "gem-release", "~> 1.0"
end
