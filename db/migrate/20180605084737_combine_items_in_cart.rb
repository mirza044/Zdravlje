class CombineItemsInCart < ActiveRecord::Migration[5.1]
  def up
    Cart.all.each do |cart|
      sums = cart.line_items.group(:item_id).sum(:quantity)
      sums.each do |item_id, quantity|
        if quantity > 1
          cart.line_items.where(item_id: item_id).delete_all

          proizvod = cart.line_items.build(item_id: item_id)
          proizvod.quantity = quantity
          proizvod.save!
        end
      end
    end
  end

  def down
    #split items with a quantity of 1 or more into multiple items
    LineItem.where("quantity>1").each do |line_item|
      line_item.quantity.times do
        LineItem.create(
          cart_id: line_item.cart_id,
          instrument_id: line_item.item_id,
          quantity: 1
        )
      end
      # remove original line item
      line_item.destroy
    end
  end
end
