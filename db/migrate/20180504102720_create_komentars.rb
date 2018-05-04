class CreateKomentars < ActiveRecord::Migration[5.1]
  def change
    create_table :komentars do |t|
      t.string :ime
      t.text :tekst
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
