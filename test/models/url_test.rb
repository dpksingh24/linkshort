require "test_helper"

class UrlTest < ActiveSupport::TestCase

  test "url name should be present" do
    @url = Url.new(name: " ")
    #if the url name is not present then it will show the error message in the console.
    assert_not @url.valid? #test for false
  end



end
