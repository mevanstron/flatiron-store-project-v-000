class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    cart_total = 0
    line_items.each do |line_item|
      cart_total += line_item.item.price * line_item.quantity
    end
    cart_total
  end

  def add_item(new_item_id)
    if line_item = line_items.find_by(item_id: new_item_id)
      line_item.quantity += 1
      line_item
    else
      LineItem.new(cart_id: self.id, item_id: new_item_id)
    end
  end
end
