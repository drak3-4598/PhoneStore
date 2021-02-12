function cart(obj){

    let foto = $('<img id="img">')
    let nome = $('<h5>')
    let prezzo = $('<p class="mb-0">')

    let addQt = $('<button class="quantity">')
    let remove = $('<button id="remove">')



    $(foto).attr("src", obj.foto)
    $(nome).html(obj.nome)
    $(prezzo).html(obj.prezzo)





}

$(".quantity").blur(function (){
    $.post("AsyncCartServlet", {codiceTel : this.id, codiceTel : $(this).val(), op : "update"}, function (){
        //aggiornare il box dei prezzi
    })
})

$("#remove").click(function (){
    $.post("AsyncCartServlet", {codiceTel : this.id, codiceTel : $(this).val(), op : "remove"}, function (){
        //aggiornare il box dei prezzi
    })
})
