


$(".quantity").focus(function (){

    $(this).data('val', $(this).val());


})


$(".quantity").blur(function (){


    let qt = parseInt($(this).val())
    let oldQt = parseInt($(this).data('val'))
    let totale = parseFloat($('#totale').html().replace("€", ""))



    let codiceTel = $(this).parent().parent().attr("id")



    $.post("AsyncCartServlet", {codiceTel : codiceTel, qt : $(this).val(), op : "update"}, function (json){


        let {prezzo} = json /*prende un determinato elemento*/

        //aggiornare il box dei prezzi
        totale -= oldQt * prezzo

        totale += qt * prezzo

        $('#totale').html("€" + totale.toFixed(2))


        $('#' + codiceTel + ' #parziale').html("€" + qt * prezzo)



    })
})



$(".remove").click(function (){


    let tr = $(this).parent().parent()
    let codiceTel = $(this).parent().parent().attr("id")
    let qt = parseInt($('#' + codiceTel + ' .quantity').val())


    $.post("AsyncCartServlet", {codiceTel : codiceTel, op : "remove", qt : 1}, function (json){

        $(tr).remove()

        let {prezzo} = json /*prende un determinato elemento*/
        let totale = parseFloat($('#totale').html().replace("€", ""))

        totale -= qt *prezzo

        $('#totale').html("€" + totale.toFixed(2))

    })
})

$(".checkout").click(function (){


    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0');
    var yyyy = today.getFullYear();

    today = dd + '/' + mm + '/' + yyyy;

    $.post("AsyncCartServlet", {op : "checkout", today : today}, function (){ })

    alert("Grazie per l'acquisto!")



})


