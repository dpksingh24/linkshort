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
class Url < ApplicationRecord

  validates :name, presence: true
  validates :website_name, presence: true
end

