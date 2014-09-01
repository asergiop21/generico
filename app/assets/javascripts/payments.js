        $(document).on('click','.remove_fields_payment', function(event){
                $(this).closest('tr').find('input[type=hidden]').val('1');
                $(this).closest('table').hide()
                event.preventDefault();
        });
