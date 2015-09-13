 var idCounter=$(this).attr("id");
            grandTotal=$("#earnDeductTotal").val()-$('#earnDeductAmountAdj'+idCounter).val();
            $("#earnDeductTotal").val(grandTotal);
            
            
            
            $('#earnDeductTotal').val( $('input.earnDeductAmountAdj').sumValues() );
            calFnc(sl);
            
            function calFnc(count){ 
       
        $('#earnDeductAmountAdj'+count).bind('keyup', function() {
            $('#earnDeductTotal').val( $('input.earnDeductAmountAdj').sumValues() );
        }); 
    }
    
    
    
     var grandTotal=0;
        $("#earnDeductTotal").val(grandTotal);
       
        
        $.fn.sumValues = function() {
        var sum = 0; 
        this.each(function() {
            if ( $(this).is(':input') ) {
                var val = $(this).val();
            } else {
                var val = $(this).text();
            }
            sum += parseFloat( ('0' + val).replace(/[^0-9-\.]/g, ''), 10 );
        });
        return sum;
    };