require 'json'

RSpec.describe Mytemplates::StackActionsValidation do
  it "has a version number" do
    expect(Mytemplates::StackActionsValidation::VERSION).not_to be nil
  end

  it "rates a good stack creation action as valid" do
    good_action = JSON.parse(
<<ACTION
{
"StackName": "foo"
}
ACTION
    )
    expect(Mytemplates::StackActionsValidation.validate(good_action)).to be true
  end

  it "rates a bad stack creation action as invalid" do
    bad_action = JSON.parse(
<<ACTION
{
"StackName": "foo",
"DisableRollback": "DO_NOT"
}
ACTION
    )

    expect{Mytemplates::StackActionsValidation.validate(bad_action)}.to raise_error JSON::Schema::ValidationError
  end

end
