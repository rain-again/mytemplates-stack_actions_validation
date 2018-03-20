
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

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if s.respond_to?(:metadata)
    s.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

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
