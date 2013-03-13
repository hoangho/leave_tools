require 'spec_helper'

describe "leave_types/show" do
  before(:each) do
    @leave_type = assign(:leave_type, stub_model(LeaveType,
      :name => "MyText",
      :cost => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/1.5/)
  end
end
