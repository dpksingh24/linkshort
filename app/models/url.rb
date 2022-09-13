class Url < ApplicationRecord

  before_save :set_hash_slug

  #error => undefined method `root_path' for #<Url: id: 1>
  # include Rails.application.routes.url_helpers

  def short_url
    # "#{ENV['ACTUAL_URL']}/#{slug_url}"
    # "#{ENV['ACTUAL_URL']}/r?slug=#{slug_url}"
    "#{"http://localhost:3000"}/r?slug=#{slug_url}"
    # "#{root_path}/#{slug_url}"
  end

  # VALID_URL_REGEX = /^((http|https):\/\/)[a-z0-9]*(\.?[a-z0-9]+)\.[a-z]{2,5}(:[0-9]{1,5})?(\/.)?$/ix
  validates :url, presence: true, uniqueness: true

  private

  def set_hash_slug
    self.slug_url = SecureRandom.hex(3) if slug.nil?
  end

end

