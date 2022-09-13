class CreateUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :urls do |t|
      t.string :url
      t.string :slug_url
      t.timestamps
    end
  end
end
