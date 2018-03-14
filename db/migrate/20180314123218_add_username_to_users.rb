class AddUsernameToUsers < ActiveRecord::Migration[5.1]
  def change  #anything inside of this method, is translated to SQL code and modified to database (currently, SQLite)
    add_column :users, :username, :string #add a new column to table "users", called "username" and of type "string"
    add_index :users, :username, unique: true #first, index usrnames for quick (rapid) lockup. Second, ensure usernames are ALWAYS unique.
  end
end
