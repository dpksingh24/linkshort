# == Schema Information
#
# Table name: urls
#
#  id           :integer          not null, primary key
#  count        :integer          default(0)
#  name         :string
#  slug         :string
#  website_name :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_urls_on_slug  (slug) UNIQUE
#
require "test_helper"

class UrlTest < ActiveSupport::TestCase

  test "url name should be present" do
    @url = Url.new(name: " ")
    #if the url name is not present then it will show the error message in the console.
    assert_not @url.valid? #test for false
  end

end
