require 'spec_helper'

describe "leave_types/new" do
  before(:each) do
    assign(:leave_type, stub_model(LeaveType,
      :name => "MyText",
      :cost => 1.5
    ).as_new_record)
  end

  it "renders new leave_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => leave_types_path, :method => "post" do
      assert_select "textarea#leave_type_name", :name => "leave_type[name]"
      assert_select "input#leave_type_cost", :name => "leave_type[cost]"
    end
  end
end
