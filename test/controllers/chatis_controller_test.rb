require 'test_helper'

class ChatisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chati = chatis(:one)
  end

  test "should get index" do
    get chatis_url
    assert_response :success
  end

  test "should get new" do
    get new_chati_url
    assert_response :success
  end

  test "should create chati" do
    assert_difference('Chati.count') do
      post chatis_url, params: { chati: { application_id: @chati.application_id, name: @chati.name } }
    end

    assert_redirected_to chati_url(Chati.last)
  end

  test "should show chati" do
    get chati_url(@chati)
    assert_response :success
  end

  test "should get edit" do
    get edit_chati_url(@chati)
    assert_response :success
  end

  test "should update chati" do
    patch chati_url(@chati), params: { chati: { application_id: @chati.application_id, name: @chati.name } }
    assert_redirected_to chati_url(@chati)
  end

  test "should destroy chati" do
    assert_difference('Chati.count', -1) do
      delete chati_url(@chati)
    end

    assert_redirected_to chatis_url
  end
end
