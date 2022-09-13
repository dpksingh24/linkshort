class Url < ApplicationRecord
  before_save :set_hash_slug

  #error => undefined method `root_path' for #<Url: id: 1>
  # include Rails.application.routes.url_helpers

  validates :url, presence: true,
  format: { with: /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix,
  message: 'needs to be a valid URL' }

  def shorturl
    # "#{ENV['ACTUAL_URL']}/#{slug_url}"
    # "#{ENV['ACTUAL_URL']}/r?slug=#{slug_url}"
    "#{"http://localhost:3000"}/r?slug=#{slug}"
  end

  private

  def set_hash_slug
    self.slug = SecureRandom.hex(3)
  end

end

