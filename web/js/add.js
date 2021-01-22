function constractCard(obj){

    let row = $('<div class="row">')
    let col = $('<div class="col-md-7">')
    let container = $('<div class="container">')
    let a =$('<a>')
    let img = $('<img class="img-fluid rounded mb-3 mb-md-0"></img>')
    let div = $(' <div class="col-md-5">')
    let h2 = $('<h2>')
    let h1 = $('<h1 class="my-4">')
    let p = $('<p>')
    let btn = $(' <button type="button" class="btn btn-primary mb-2 ripple-surface" data-toggle="modal" data-target="#exampleModal">Visualizza</button>')

    let modal = $('<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">')
    let modaldial = $(' <div class="modal-dialog modal-side modal-top-right" role="document">')
    let modalcont = $('<div class="modal-content">')
    let modalhead = $('<div class="modal-header">')
    let modalH5 = $('<h5>')
    let modalclose = $('<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>')
    let modalbody = $('<div class="modal-body">')
    let select = $('<select class="form-select" aria-label="Default select example">')
    let option = $('<option selected> - Seleziona la quantità - </option>')
    let modalfooter = $('<div class="modal-footer">')
    let modalbtnclose = $('<button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>')
    let modaladd = $('<button type="button" class="btn btn-primary" ><i class="fas fa-shopping-cart"></i> Aggiungi al carrello</button>')
    let p1 = $('<p id="qt">Q.tà disponibile: </p>')
    let p2 = $('<p id="prezz">Prezzo: </p>')
    let h3 = $('<h3>')

    /*Append Modal*/
    $(modalH5).html(obj.nome)
    $(p1).html(obj.quantita)
    $(p2).html(obj.prezzo)

    $(select).append(option)

    $(modalhead).append(modalH5)
    $(modalhead).append(modalclose)

    $(modalbody).append(p1)
    $(modalbody).append(p2)
    $(modalbody).append(select)

    $(modalfooter).append(modalbtnclose)
    $(modalfooter).append(modaladd)

    $(modalcont).append(modalhead)
    $(modalcont).append(h3)
    $(modalcont).append(modalbody)
    $(modalcont).append(modalfooter)

    $(modaldial).append(modalcont)
    $(modal).append(modaldial)

    /*ProductCard*/
    $(p).html(obj.descrizione)
    $(h2).html(obj.nome)
    $(img).attr("src", obj.foto)

    $(div).append(h2)
    $(div).append(p)
    $(div).append(btn)
    $(div).append(modal)

    $(a).append(img)

    $(col).append(a)

    $(row).append(col)
    $(row).append(div)

    $(container).append(h1)
    $(container).append(row)
    $(container).append(modal)

    return container;

}