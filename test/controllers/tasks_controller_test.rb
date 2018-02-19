require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tasklist = tasklists(:backlog)
    @task = tasks(:one)
    @task_url = "http://www.example.com/boards/" +
      @tasklist.board_id.to_s() + "/tasklists/" + @tasklist.id.to_s() + "/tasks"
  end

  test "should get index" do
    get @task_url, as: :json
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post @task_url, params: { task: { name: @task.name } }, as: :json
    end

    assert_response 201
  end

  test "should show task" do
    get @task_url + "/" + @task.id.to_s(), as: :json
    assert_response :success
  end

  test "should update task" do
    patch @task_url + "/" +  @task.id.to_s(), params: { task: { name: @task.name } }, as: :json
    assert_response 200
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete @task_url + "/" + @task.id.to_s(), as: :json
    end

    assert_response 204
  end
end
