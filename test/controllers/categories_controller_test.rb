require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do 
    @category = Category.create(name: "Subject 1")
  end

  test "should get index" do
    get categories_path
    assert_response :success
  end

  test "should get new" do
    get new_category_path
    assert_response :success
  end

  test "should show category" do
    get category_path(@category)
    assert_response :success
  end

  test "should create category" do
    assert_difference('Category.count', 1) do
      post categories_path, params: { category: { name: "Subject 2" }}
    end
    assert_response :redirect
  end

end