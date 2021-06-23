class AddReviewToVotes < ActiveRecord::Migration[6.0]
  def change
    add_reference :votes, :review, null: false, foreign_key: true
  end
end
