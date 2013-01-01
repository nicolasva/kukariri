require 'spec_helper'

describe "provided_dates/edit" do
  before(:each) do
    @provided_date = assign(:provided_date, stub_model(ProvidedDate))
  end

  it "renders the edit provided_date form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => provided_dates_path(@provided_date), :method => "post" do
    end
  end
end
