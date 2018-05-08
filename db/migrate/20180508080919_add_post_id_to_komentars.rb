class AddPostIdToKomentars < ActiveRecord::Migration[5.1]
  def change
    add_column :komentars, :post_id, :integer
  end
end
