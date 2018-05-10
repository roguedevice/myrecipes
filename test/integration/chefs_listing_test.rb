require 'test_helper'

class ChefsListingTest < ActionDispatch::IntegrationTest
  
  def setup
    @chef = Chef.create!(chefname: "Olivia", email: "olivia@gmail.com",
                        password: "password", password_confirmation: "password")
    @chef2 = Chef.create!(chefname: "Jessica", email: "jess@gmail.com",
                        password: "password2", password_confirmation: "password2")
  end

  test "should get chefs index" do
    get chefs_url
    assert_response :success
  end

  test "should get chefs listing" do
    get chefs_path
    assert_template "chefs/index"
    assert_select "a[href=?]", chef_path(@chef), text: @chef.chefname.capitalize
    assert_select "a[href=?]", chef_path(@chef2), text: @chef2.chefname.capitalize
  end
end