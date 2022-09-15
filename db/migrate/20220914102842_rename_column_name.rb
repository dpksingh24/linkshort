class RenameColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :urls, :url, :name
    rename_column :urls, :slug_url, :slug
  end
end
