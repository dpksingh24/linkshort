class Url < ApplicationRecord
  # before_create :set_hash_slug

  #error => undefined method `root_path' for #<Url: id: 1>
  # include Rails.application.routes.url_helpers

  validates :name, presence: true

  # private
  # def set_hash_slug
  #   self.slug = SecureRandom.hex(3)
  # end

end

