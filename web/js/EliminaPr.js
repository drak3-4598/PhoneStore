function constractCard(obj){

    let tr = $('<tr>')

    let codice = $('<th scope="row">')
    let marca = $('<td id="marca">')
    let nome = $('<td id="nome">')
    let descrizione = $('<td id="descrizione">')
    let prezzo = $('<td id="prezzo">')
    let qt = $('<td id="qt">')
    let container = $('<td>')
    let btn = $('<button class="btn btn-primary btn-sm">Elimina</button>')

    $(codice).html(obj.codiceTel)
    $(marca).html(obj.marca)
    $(nome).html(obj.nome)
    $(descrizione).html(obj.descrizione)
    $(prezzo).html(obj.prezzo)
    $(qt).html(obj.quantita)
    $(btn).attr("id",obj.codiceTel)
    $(btn).click(listener)


    $(tr).append(codice)
    $(tr).append(marca)
    $(tr).append(nome)
    $(tr).append(descrizione)
    $(tr).append(prezzo)
    $(tr).append(qt)
    $(container).append(btn)
    $(tr).append(container)

    return tr;

}

function listener(){
    let btn = this;
    $.post("EliminaProdottoServlet",{codiceTel : this.id} , function () {
        alert("Prodotto eliminato!")
        let td = $(btn).parent()
        let tr = $(td).parent()
        console.log($(td), $(tr))
        $(tr).remove()
    })
}