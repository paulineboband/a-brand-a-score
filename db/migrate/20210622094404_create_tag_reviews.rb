class CreateTagReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :tag_reviews do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :review, null: false, foreign_key: true

      t.timestamps
    end
  end
end
