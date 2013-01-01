require 'spec_helper'

describe "provided_dates/new" do
  before(:each) do
    assign(:provided_date, stub_model(ProvidedDate).as_new_record)
  end

  it "renders new provided_date form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => provided_dates_path, :method => "post" do
    end
  end
end
