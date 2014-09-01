class Invoice < ActiveRecord::Base

scope :invoices, ->(id){where("customer_id= ?", "#{id}")}

#attr_accessible :customer_id, :price_total, :orders_attributes, :payments_attributes, :current_account, :cancelar_invoice


   has_many  :orders
   has_many  :payments
   belongs_to :customer
   
   accepts_nested_attributes_for :orders, :reject_if => lambda {|a| a[:article_id].blank?}
   accepts_nested_attributes_for :payments, allow_destroy: true


  validates_associated :customer
  validates_presence_of :customer_id, presence: true
   
   def self.total_amount_invoice
      sum('price_total', :conditions => ['cancelar_invoice = ?', false])
   end

   def self.total_amount(customer)
      sum('price_total', :conditions => ['cancelar_invoice = ? and customer_id = ?', false,  customer ])
   end

   def self.sum_pay(id)
      Payment.where('invoice_id = ?', id).sum('amount')
   end

end
