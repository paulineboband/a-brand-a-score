class AddKeywordToNlp < ActiveRecord::Migration[6.0]
  def change
    add_column :nlps, :keyword, :text
  end
end
