class ChangeDatesToBeHashInBikes < ActiveRecord::Migration[5.2]
  def change
    remove_column :bikes, :dates
    add_column :bikes, :dates, :json, default: {}
  end
end
