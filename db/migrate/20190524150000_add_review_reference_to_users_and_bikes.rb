class AddReviewReferenceToUsersAndBikes < ActiveRecord::Migration[5.2]
  def change
    add_reference :bikes, :review, foreign_key: true
    add_reference :users, :review, foreign_key: true
  end
end
