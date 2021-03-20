function constractCard(obj){

    let tr = $('<tr>')

    let codiceFattura = $('<td id="codiceFattura">')
    let nomePr = $('<td id="nome">')
    let qt = $('<td id="qt">')
    let prezzo = $('<td id="prezzo">')

    let {id, list} = obj

    for(let i of list){
        $(nomePr).html(i.nome)
        $(qt).html(i.qt)
        $(prezzo).html("€" + i.prezzoUni.toFixed(2))
    }

    $(codiceFattura).html(id)

    $(tr).append(codiceFattura)
    $(tr).append(nomePr)
    $(tr).append(qt)
    $(tr).append(prezzo)


    return tr;
}