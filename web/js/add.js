function constractCard(obj){

    let row = $('<div class="row">')
    let col = $('<div class="col-md-7">')
    let container = $('<div class="container">')
    let a =$('<a>')
    let img = $('<img class="img-fluid rounded mb-3 mb-md-0"></img>')
    let div = $(' <div class="col-md-5">')
    let h2 = $('<h2>')
    let h3 = $('<h3>')
    let h1 = $('<h1 class="my-4">')
    let p = $('<p>')
    let btn = $('<a class="btn btn-primary">Visualizza</a>')

    $(p).html(obj.descrizione)
    $(h2).html(obj.nome)
    $(img).attr("src", obj.foto)

    $(div).append(h2)
    $(div).append(p)
    $(div).append(btn)

    $(a).append(img)

    $(col).append(a)

    $(row).append(col)
    $(row).append(div)

    $(container).append(h1)
    $(container).append(row)

    return container;

}