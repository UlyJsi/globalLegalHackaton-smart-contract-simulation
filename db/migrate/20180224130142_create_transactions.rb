class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.string :username
      t.string :password_digest
      t.integer :user_id
      t.timestamps
    end
  end
end
