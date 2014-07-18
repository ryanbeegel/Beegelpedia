class AddImageToWikis < ActiveRecord::Migration
  def change
    add_column :wikis, :image, :string
  end
end
