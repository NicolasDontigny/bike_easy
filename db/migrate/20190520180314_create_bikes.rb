class CreateBikes < ActiveRecord::Migration[5.2]
  def change
    create_table :bikes do |t|
      t.string :name
      t.string :category
      t.text :description
      t.string :photo
      t.string :gender
      t.string :size
      t.integer :rating
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
