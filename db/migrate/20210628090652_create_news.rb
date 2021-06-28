class CreateNews < ActiveRecord::Migration[6.0]
  def change
    create_table :news do |t|
      t.string :title
      t.text :description
      t.string :url
      t.string :date
      t.string :image_url
      t.references :brand, null: false, foreign_key: true

      t.timestamps
    end
  end
end
