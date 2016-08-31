class CreateInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.integer :user_id
      t.integer :candidate_id
      t.integer :money

      t.timestamps null: false
    end
    add_index :investments, :user_id
    add_index :investments, :candidate_id
    add_index :investments, [:user_id, :candidate_id], unique: true
  end
end
