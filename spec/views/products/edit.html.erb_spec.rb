require 'spec_helper'

describe "products/edit" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :name => "MyString",
      :price => 1.5
    ))
  end

  it "renders the edit product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", product_path(@product), "post" do
      assert_select "input#product_name[name=?]", "product[name]"
      assert_select "input#product_price[name=?]", "product[price]"
    end
  end
end
