class AddWebsiteNameColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :urls, :website_name, :string
  end
end
