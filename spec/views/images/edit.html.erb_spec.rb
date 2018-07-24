require 'rails_helper'

RSpec.describe "images/edit", type: :view do
  before(:each) do
    @image = assign(:image, Image.create!(
      :name => "MyString",
      :picture => "MyString",
      :user => nil
    ))
  end

  it "renders the edit image form" do
    render

    assert_select "form[action=?][method=?]", image_path(@image), "post" do

      assert_select "input[name=?]", "image[name]"

      assert_select "input[name=?]", "image[picture]"

      assert_select "input[name=?]", "image[user_id]"
    end
  end
end
