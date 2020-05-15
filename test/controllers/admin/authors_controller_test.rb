require 'test_helper'

class Admin::AuthorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_authors_index_url
    assert_response :success
  end

end
