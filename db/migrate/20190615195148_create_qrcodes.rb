class CreateQrcodes < ActiveRecord::Migration[5.2]
  def change
    create_table :qrcodes do |t|
      t.references :item, foreign_key: true
      t.string :url

      t.timestamps
    end
  end
end
