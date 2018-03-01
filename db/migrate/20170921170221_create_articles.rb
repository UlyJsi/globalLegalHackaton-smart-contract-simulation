class CreateArticles < ActiveRecord::Migration[5.1] # articles table in database
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.timestamps
    end
  end
end
