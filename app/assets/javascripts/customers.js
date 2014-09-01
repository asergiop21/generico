$(document).ready(function(){

   $(document).on('click','.remove_fields', function(event){

      $(this).prev('input[type=hidden]').val('1')
      $(this).closest('fieldset').hide()
      event.preventDefault();
   });

   $('.add_fields').click(function(event){
      time = new Date().getTime();
      regexp = new RegExp($(this).data('id'), 'g');
      $(this).before($(this).data('fields').replace(regexp, time))
      $('.order').focus(); 
   event.preventDefault();
   });

   $('div.search').on('focus', '[data-autocomplete-field]', function(){
      var input = $(this);
      input.autocomplete({
         source: function(request, response) {
            $.ajax({
               url: input.data('autocomplete-url'),
               dataType: 'json', data: { q: request.term },
               success: function(data) {
                  response(
                     $.map(data, function(item) {
                        return { label: item.lastname + " "+ item.name , item: item};
                     })
                     );
               },
            });
         },
         select: function(event, ui) {
            input.val(ui.item.label);
            $(input.data('autocomplete-for')).val(ui.item.item.id);
         }
      }).removeAttr('data-autocomplete-field'); });
}); 
