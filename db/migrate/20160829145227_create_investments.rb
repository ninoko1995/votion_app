class CreateInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.integer :user_id
      t.integer :candidate_id
      t.integer :money

      t.timestamps null: false
    end
  end
end
