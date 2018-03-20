require 'json'

RSpec.describe Mytemplates::StackActionsValidation do

  context 'specifying a version of this gem' do
    it "test for VERSION" do
      expect(Mytemplates::StackActionsValidation::VERSION).not_to be nil
    end
  end

  context "INVALID stack creation actions" do

    it "rates known bad stack creation action" do
      bad_action = JSON.parse(
          <<ACTION
{
"StackName": "foo",
"DisableRollback": "DO_NOT"
}
ACTION
      )

      expect { Mytemplates::StackActionsValidation.validate(bad_action) }.to raise_error JSON::Schema::ValidationError
    end

    it "rates examples of bad stack creation actions" do
      valid_actions = Dir.glob(File.join(File.dirname(__FILE__), 'resources', 'stack_actions', 'create-stack', 'invalid', "*.json"))
      raise "Schema validation examples not found for INVALID" if valid_actions.empty?
      valid_actions.each do |action_file|
        puts "Invalid stack action: #{Pathname.new(action_file).basename}"
        action = JSON.parse(IO.read(action_file))
        expect { Mytemplates::StackActionsValidation.validate(action) }.to raise_error JSON::Schema::ValidationError
      end
    end

  end

  context "VALID stack creation actions" do

    it "rates a known good stack creation action" do
      good_action = JSON.parse(
          <<ACTION
{
"StackName": "foo"
}
ACTION
      )
      expect(Mytemplates::StackActionsValidation.validate(good_action)).to be true
    end

    it "rates examples of good stack creation actions" do
      valid_actions = Dir.glob(File.join(File.dirname(__FILE__), 'resources', 'stack_actions', 'create-stack', 'valid', "*.json"))
      raise "Schema validation examples not found for VALID" if valid_actions.empty?
      valid_actions.each do |action_file|
        puts "Valid stack action: #{Pathname.new(action_file).basename}"
        action = JSON.parse(IO.read(action_file))
        expect(Mytemplates::StackActionsValidation.validate(action)).to be true
      end
    end

  end
end
