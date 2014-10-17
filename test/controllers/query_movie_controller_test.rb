require 'test_helper'

class QueryMovieControllerTest < ActionController::TestCase
  test "should get query_movie" do
    get :query_movie
    assert_response :success
  end

end
