class AddImagePathToSpecials < ActiveRecord::Migration[5.2]
  def change
    add_column :specials, :image_path, :text
  end
end
