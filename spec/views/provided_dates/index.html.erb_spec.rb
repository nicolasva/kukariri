require 'spec_helper'

describe "provided_dates/index" do
  before(:each) do
    assign(:provided_dates, [
      stub_model(ProvidedDate),
      stub_model(ProvidedDate)
    ])
  end

  it "renders a list of provided_dates" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
