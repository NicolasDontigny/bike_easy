class AddProfileDescriptionToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_description, :text
  end
end
