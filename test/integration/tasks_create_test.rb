require "test_helper"

class TasksCreateTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "invalid task" do
    get root_url
    assert_no_difference "Task.count" do
      post tasks_path, params: {task: {
        title: "",
        status: "",
        deadline: ""
      }}
    end
    assert_response :unprocessable_entity
    assert_template "tasks/index"
  end

  test "valid task" do
    get root_url
    assert_difference "Task.count", 1 do
      post tasks_path, params: {task: {
        title: "testtask",
        status: "InProgress",
        deadline: "2023-09-01"
      }}
    end
    follow_redirect!
    assert_template "tasks/index"
  end
end
