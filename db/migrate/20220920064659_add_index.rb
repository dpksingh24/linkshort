class AddIndex < ActiveRecord::Migration[7.0]
  def change
    add_index :urls, :slug, unique: true
  end
end
