class CreateAuthToken < ActiveRecord::Migration
  def change
    create_table :auth_tokens do |t|
      t.integer :user_id
      t.string :token

      t.index :user_id
    end
  end
end
