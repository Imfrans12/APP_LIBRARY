require 'test_helper'

class MsBooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ms_books_index_url
    assert_response :success
  end

  test "should get show" do
    get ms_books_show_url
    assert_response :success
  end

  test "should get new" do
    get ms_books_new_url
    assert_response :success
  end

  test "should get create" do
    get ms_books_create_url
    assert_response :success
  end

  test "should get edit" do
    get ms_books_edit_url
    assert_response :success
  end

  test "should get update" do
    get ms_books_update_url
    assert_response :success
  end

  test "should get destroy" do
    get ms_books_destroy_url
    assert_response :success
  end

end
