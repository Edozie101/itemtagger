class AddDescriptionToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :description, :text_area
  end
end
