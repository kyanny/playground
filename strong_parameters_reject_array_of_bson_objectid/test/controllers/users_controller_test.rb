require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
  end

  test "should get index" do
  end

  test "should get new" do
  end

  test "should create user" do
    id = BSON::ObjectId.new
    post :create, user: { reference_ids: [id] }
    data = JSON.parse(response.body)
    pp data
    assert_equal data['user_params']['reference_ids'], [id.to_s]
  end

  test "should create user (2)" do
    id = BSON::ObjectId.new
    post :create, user: { reference_ids: [id] }
    data = JSON.parse(response.body)
    pp data
    assert_equal data['user_params2']['reference_ids'], [id.to_s]
  end

  test "should show user" do
  end

  test "should get edit" do
  end

  test "should update user" do
  end

  test "should destroy user" do
  end
end
