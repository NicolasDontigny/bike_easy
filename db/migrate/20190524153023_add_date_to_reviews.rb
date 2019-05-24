class AddDateToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :date, :date
  end
end
