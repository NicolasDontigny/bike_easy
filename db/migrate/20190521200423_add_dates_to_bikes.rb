class AddDatesToBikes < ActiveRecord::Migration[5.2]
  def change
    add_column :bikes, :dates, :text, array: true, default: []
  end
end
