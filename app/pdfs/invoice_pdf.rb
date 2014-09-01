class InvoicePdf < Prawn::Document
 require "prawn/table"
   def initialize(invoice, user)
      super(top_margin: 70, page_size: "A5")
      @invoice = invoice
      @user = user
      #text "Cliente: " + @invoice.customer.name + ", " + @invoice.customer.lastname
      text "Fecha: " + I18n.l(@invoice.created_at , format: :short)
      text "Presupuesto \##{@invoice.id}"
      line_items
      print_user
      total
   end
   def line_items
      move_down 20
      if @invoice.current_account == false
         table line_item_rows
      else
         table line_item_rows_without_price
      end
   end

   def line_item_rows
      [["Cantidad", "Producto", "Precio Unit", "Precio Total"]] +
         @invoice.orders.map do |item|
         [item.quantity, item.name, item.unit_price, item.price_total]
      end
   end

   def line_item_rows_without_price
      [["Cantidad", "Producto"]] +
         @invoice.orders.map do |item|
         [item.quantity, item.name]
      end
   end

   def print_user
      text "Usuario: " + @user.name
   end
   def total
      text "Total a pagar: " +  @invoice.price_total.to_s
   end
end
