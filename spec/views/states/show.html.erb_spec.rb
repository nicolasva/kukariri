require 'spec_helper'

describe "states/show" do
  before(:each) do
    @state = assign(:state, stub_model(State))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
