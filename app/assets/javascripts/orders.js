$(document).ready(function(){
   $(document).on('click','.remove_fields_orders', function(event){

      $(this).closest('div.line').find('input[type=hidden]').val('1');
      var price_remove = $(this).closest('div.line').find('input.price_subtotal').val();

      var price_total = $('#invoice_price_total').val();

      if (price_total > 0)
   {
      var valor = parseFloat(price_total) - parseFloat(price_remove);
      valor = valor.toFixed(2);
   }
   price_total = $('#invoice_price_total').val(valor);
   $(this).closest('div.line').hide()
      event.preventDefault();
   });

   $('div.line2').on('focus', '[data-autocomplete-for]', function(){
      var input = $(this);
      input.autocomplete({
         source: function(request, response) {
            $.ajax({
               url: input.data('autocomplete-url'),
               dataType: 'json', data: { q: request.term },
               success: function(data) {
                  response(
                     $.map(data, function(item) {
                        return {label:item.label, item: item};
                     })
                     );
               },
            });
         },
         minLength: 3,
         select: function(event, ui) {

            input.val(ui.item.label);
            var field = this.id;
            var id = field.split("_");
            var field_article_id = '#invoice_orders_attributes_' + id[3] + '_article_id';
            var field_unit_price = '#invoice_orders_attributes_' + id[3] + '_unit_price';
            var quantity_stock = '#invoice_orders_attributes_' + id[3] + '_quantity_stock';
            $(field_article_id).val(ui.item.item.id);
            $(field_unit_price).val(ui.item.item.price_total);
            $(quantity_stock).val(ui.item.item.quantity);
         }
      }).removeAttr('data-autocomplete-field');


   });

   $(document).on('blur', '.quantity , .discount', function(event){

      var field = this.id;
      var id = field.split("_");
      var input = $('#invoice_orders_attributes_'+ id[3]+ '_quantity').val();
      if (input == 0)
   {
      $(this).val(0);
      input = 0;
   }

   var price_subtotal = '#invoice_orders_attributes_' + id[3] + '_price_total';

   var price = $('#invoice_orders_attributes_' + id[3] + '_unit_price').val();
   var quantity_stock = $('#invoice_orders_attributes_' + id[3] + '_quantity_stock').val();
   var descuento = $('#invoice_orders_attributes_' + id[3] + '_discount').val();

   if (descuento == 0 || descuento == ""){
      descuento = 0
   }
   /*        if ( parseFloat(input) > parseFloat(quantity_stock) )
             {
             input = quantity_stock
             $(this).css({'background': 'red'})
             $(this).val(quantity_stock);
             }else{

             $(this).css({'background': '#FFF'})
             }
             */
   var price_x_quantity = parseFloat(input) * parseFloat(price);
   var price_con_descuento =  (price_x_quantity - ((price_x_quantity * descuento ) /100)).toFixed(2);

   $(price_subtotal).val(price_con_descuento);

   var prr = $('#invoice_price_total').val();
   if (prr == 0)
   {
      prr = 0.00;
   }
   valor = 0;
   $(document).find('.price_subtotal').each(function(){

      re = $(this).val();
      if (!isNaN(re)){
         valor += parseFloat(re);
      }

   });

   $('#invoice_price_total').val(valor.toFixed(2));
   });

   $(document).on('keydown', 'input, select, textarea', function(e) {
      var a = this.id 
      var self = $(this),
      form = self.parents('form:eq(0)'),
      focusable,
      next;

   if (e.keyCode == 13) {
      focusable = form.find('input,a,textarea').filter(':visible').not(".remove_fields_orders");
      next = focusable.eq(focusable.index(this)+1);
      if (next.length) {
         next.focus();
         next.select();
      } else {
         form.submit();
      }
      return false;
   }
   });
})
