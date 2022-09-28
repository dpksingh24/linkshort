class ClickCount

  include Sidekiq::Worker
  require 'csv'

  def perform(url_id)
    @url = Url.find_by(id: url_id)
    @url.count += 1
    @url.save!

    csv = CSV.generate do |rows|
      rows << ["Id","Clicks", "Website"]
      Url.all.each do |links|
        row << [links.id]
        row << links.count
        row << links.website_name
        rows << row
      end
    end
    File.open("clicks.csv", "a") { |file| file.write(csv) }
  end
end
