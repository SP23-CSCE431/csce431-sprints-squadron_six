class AddAuthuserIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :authuser, foreign_key: true
  end
end
