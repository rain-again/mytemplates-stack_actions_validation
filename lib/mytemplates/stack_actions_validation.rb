require "mytemplates/stack_actions_validation/version"

require 'json'
require 'json-schema'

module Mytemplates
  module StackActionsValidation

    @schema = JSON.parse(IO.read(File.join(File.dirname(__FILE__), 'stack_actions_validation', 'resources', 'schema.json')))

    def self.validate(stack_action)
      JSON::Validator.validate!(@schema, stack_action)
    end

  end
end
