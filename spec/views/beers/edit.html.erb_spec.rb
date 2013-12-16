require 'spec_helper'

describe "beers/edit" do
  before(:each) do
    @beer = assign(:beer, stub_model(Beer,
      :name => "MyString",
      :style => "MyString",
      :brewery_id => 1
    ))
  end

  it "renders the edit beer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", beer_path(@beer), "post" do
      assert_select "input#beer_name[name=?]", "beer[name]"
      assert_select "input#beer_style[name=?]", "beer[style]"
      assert_select "input#beer_brewery_id[name=?]", "beer[brewery_id]"
    end
  end
end
