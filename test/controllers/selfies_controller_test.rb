require 'test_helper'

class SelfiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @selfie = selfies(:one)
  end

  test "should get index" do
    get selfies_url
    assert_response :success
  end

  test "should get new" do
    get new_selfie_url
    assert_response :success
  end

  test "should create selfie" do
    assert_difference('Selfie.count') do
      post selfies_url, params: { selfie: { image: @selfie.image, student_id: @selfie.student_id } }
    end

    assert_redirected_to selfie_url(Selfie.last)
  end

  test "should show selfie" do
    get selfie_url(@selfie)
    assert_response :success
  end

  test "should get edit" do
    get edit_selfie_url(@selfie)
    assert_response :success
  end

  test "should update selfie" do
    patch selfie_url(@selfie), params: { selfie: { image: @selfie.image, student_id: @selfie.student_id } }
    assert_redirected_to selfie_url(@selfie)
  end

  test "should destroy selfie" do
    assert_difference('Selfie.count', -1) do
      delete selfie_url(@selfie)
    end

    assert_redirected_to selfies_url
  end
end
