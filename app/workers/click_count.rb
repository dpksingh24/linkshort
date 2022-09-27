class ClickCount
  include Sidekiq::Worker

  def perform(url_id)
    @url = Url.find_by(id: url_id)
    @url.count += 1
    @url.save!
  end

end
