class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items
  has_many :carts, through: :line_items

  def self.available_items
    Item.all.reject do |item|
      item.inventory == 0
    end
  end

  def self.update_inventory(sold_items)
    sold_items.each do |sold_item|
      item = Item.find_by(id: sold_item.item_id)
      item.inventory -= sold_item.quantity
      item.save
    end
  end
end
