class Create < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.string :title
      t.string :body
      t.string :linkTitle
      t.string :url

      t.timestamps null: false
    end
  end
end
