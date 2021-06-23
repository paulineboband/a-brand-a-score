class CreateNlps < ActiveRecord::Migration[6.0]
  def change
    create_table :nlps do |t|
      t.string :sentiment_label
      t.float :sentiment_score
      t.float :sadness
      t.float :joy
      t.float :fear
      t.float :disgust
      t.float :anger
      t.references :brand, null: false, foreign_key: true

      t.timestamps
    end
  end
end
