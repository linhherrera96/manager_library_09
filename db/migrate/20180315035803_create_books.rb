class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :name
      t.integer :category_id
      t.string :publisher
      t.integer :author_id
      t.text :description
      t.integer :quantity
      t.integer :rating_average

      t.timestamps
    end
  end
end
