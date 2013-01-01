require 'spec_helper'

describe "provided_dates/show" do
  before(:each) do
    @provided_date = assign(:provided_date, stub_model(ProvidedDate))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
