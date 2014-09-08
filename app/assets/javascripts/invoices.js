$(document).ready(function(){
   $('#printOut').click(function(e){
               e.preventDefault();
                           /*var w = window.open();
                            *           
                            *                       #w.window.print();
                            *                                   #w.document.close();*/
                           window.print();
                                       return false;
                                               });
});
