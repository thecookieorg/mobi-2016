require 'test_helper'

class HotSpotsControllerTest < ActionController::TestCase
  setup do
    @hot_spot = hot_spots(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hot_spots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hot_spot" do
    assert_difference('HotSpot.count') do
      post :create, hot_spot: { name: @hot_spot.name }
    end

    assert_redirected_to hot_spot_path(assigns(:hot_spot))
  end

  test "should show hot_spot" do
    get :show, id: @hot_spot
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hot_spot
    assert_response :success
  end

  test "should update hot_spot" do
    patch :update, id: @hot_spot, hot_spot: { name: @hot_spot.name }
    assert_redirected_to hot_spot_path(assigns(:hot_spot))
  end

  test "should destroy hot_spot" do
    assert_difference('HotSpot.count', -1) do
      delete :destroy, id: @hot_spot
    end

    assert_redirected_to hot_spots_path
  end
end
