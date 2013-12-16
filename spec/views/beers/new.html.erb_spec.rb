require 'spec_helper'

describe "beers/new" do
  before(:each) do
    assign(:beer, stub_model(Beer,
      :name => "MyString",
      :style => "MyString",
      :brewery_id => 1
    ).as_new_record)
  end

  it "renders new beer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", beers_path, "post" do
      assert_select "input#beer_name[name=?]", "beer[name]"
      assert_select "input#beer_style[name=?]", "beer[style]"
      assert_select "input#beer_brewery_id[name=?]", "beer[brewery_id]"
    end
  end
end
