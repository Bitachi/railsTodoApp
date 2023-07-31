require "test_helper"

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @task = Task.new(title: "test task", status: "InProgress", deadline: "2023-080-31")
  end

  test "title should not be too long" do
    @task.title = "a" * 41
    assert_not @task.valid?
  end

  test "status should be filled in" do
    @task.status = nil
    assert_not @task.valid?
  end
end
