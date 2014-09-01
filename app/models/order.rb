class Order < ActiveRecord::Base
#  attr_accessible :article_id, :invoice_id, :price_total, :quantity, :unit_price, :name, :quantity_stock, :discount

  attr_accessor :quantity_stock

  belongs_to :article
  belongs_to :invoice


   def order_name
      Article.name  
   end



end
