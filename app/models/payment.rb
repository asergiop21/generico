class Payment < ActiveRecord::Base
  attr_accessible :amount, :invoice_id, :description, :created_at

belongs_to :invoice



end
