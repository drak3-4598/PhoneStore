function constractCard(obj){

    let row = $('<div class="row">')
    let card = $('<div class="mb-3">')
    let container = $('<div id="nomecontainer">')
    let btn_remove = $('<div id="btn">')
    let justify = $('<div class="d-flex justify-content-between align-items-center">')

    let mask = $('<div class="mask">')
    let img = $('<img>')


    let info = $('<p>')

    let row2 = $('<div class="row mb-4">')
    let col = $('<div class="col-md-7 col-lg-9 col-xl-9">')
    let nome = $('<h5>')
    let descr = $('<p>')
    let remove = $('<a>')
    let prezzo = $('<p>')

    let column = $('<div class="col-lg-4">')
    let pt = $('<div class="pt-4">')

    let ul = $('<ul class="list-group list-group-flush">')
    let li = $('<li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">')
    let span = $('<span>')
    let li1 = $('<li class="list-group-item d-flex justify-content-between align-items-center px-0">')
    let span1 = $('<span>')

    let btn = $('<button type="button">')

    $(img).attr("src", obj.foto)
    $(nome).html(obj.nome)
    $(descr).html(obj.descrizione)
    $(remove).click(listener)
    $(prezzo).html(obj.prezzo)

    $(mask).append(img)
    $(container).append(nome)
    $(container).append(descr)

    $(btn_remove).append(remove)
    $(justify).append(btn_remove)
    $(justify).append(prezzo)

    $(col).append(container)
    $(col).append(justify)

    $(card).append(img)
    $(card).append(col)
    $(card).append(info)

    return card;




}
function listener(){}