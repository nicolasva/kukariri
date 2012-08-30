require 'spec_helper'

describe "states/new" do
  before(:each) do
    assign(:state, stub_model(State).as_new_record)
  end

  it "renders new state form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => states_path, :method => "post" do
    end
  end
end
