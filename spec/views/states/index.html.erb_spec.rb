require 'spec_helper'

describe "states/index" do
  before(:each) do
    assign(:states, [
      stub_model(State),
      stub_model(State)
    ])
  end

  it "renders a list of states" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
