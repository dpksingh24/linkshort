class Url < ApplicationRecord
  #before_create :set_hash_slug

  
  validates :name, presence: true

  

  private
  def set_hash_slug
    self.slug = SecureRandom.hex(2)
    # self.slug = SecureRandom.uuid
  end

end

