class AddNaslovToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :naslov, :string
  end
end
