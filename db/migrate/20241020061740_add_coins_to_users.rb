class AddCoinsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :coins, :integer, default: 0
  end
end
