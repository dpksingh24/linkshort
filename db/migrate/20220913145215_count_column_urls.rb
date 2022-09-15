class CountColumnUrls < ActiveRecord::Migration[7.0]
  def change
    add_column :urls, :count, :integer, default: 0, null: false
  end
end
