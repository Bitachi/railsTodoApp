require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should get root" do
    get root_url
    assert_response :success
  end

  test "should get index page" do
    get tasks_index_url
    assert_response :success
  end

end
