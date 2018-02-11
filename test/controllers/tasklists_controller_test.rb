require 'test_helper'

class TasklistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @board = boards(:boardwalk)
    @tasklist = tasklists(:backlog)
    @tasklist_url = "http://www.example.com/boards/" + @board.id.to_s() + "/tasklists"
  end

  test "should get index" do
    get @tasklist_url, as: :json
    assert_response :success
  end

  test "should create tasklist" do
    assert_difference('Tasklist.count') do
      post @tasklist_url, params: { tasklist: { name: "the list" } }, as: :json
    end

    assert_response 201
  end

  test "should show tasklist" do
    get @tasklist_url + "/" + @tasklist.id.to_s(), as: :json
    assert_response :success
  end

  test "should update tasklist" do
    patch @tasklist_url + "/" + @tasklist.id.to_s(),
      params: { tasklist: { name: "a changed name" } },
      as: :json
    assert_response 200
  end

  test "should destroy tasklist" do
    assert_difference('Tasklist.count', -1) do
      delete @tasklist_url + "/" + @tasklist.id.to_s(), as: :json
    end

    assert_response 204
  end
end
