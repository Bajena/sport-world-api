class AddTokenValidUntil < ActiveRecord::Migration
  def change
    add_column :auth_tokens, :valid_until, :datetime
  end
end
