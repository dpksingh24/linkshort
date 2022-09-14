class Url < ApplicationRecord
  before_save :set_hash_slug

  #error => undefined method `root_path' for #<Url: id: 1>
  # include Rails.application.routes.url_helpers

  validates :name, presence: true

  # def short_url
  #   # "#{ENV['ACTUAL_URL']}/#{slug_url}"
  #   # "#{ENV['ACTUAL_URL']}/r?slug=#{slug_url}"
  #   "#{"http://localhost:3000"}/redirect?slug=#{slug}"
  # end

  private
  def set_hash_slug
    self.slug = SecureRandom.hex(2)
    # self.slug = SecureRandom.uuid
  end

end

