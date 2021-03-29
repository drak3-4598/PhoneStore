function constractCard(obj){

    let tr = $('<tr>')

    let codiceFattura = $('<td id="codiceFattura">')
    let nomePr = $('<td id="nome">')
    let qt = $('<td id="qt">')
    let prezzo = $('<td id="prezzo">')

    let {id, list} = obj

    let prod = ""
    let qt1 = ""
    let price = ""

    $(codiceFattura).html(id)
    $(tr).append(codiceFattura)

    for(let i of list){
        prod += i.nome + "<br>"
        qt1 += i.qt + "<br>"
        price += "€" + i.prezzoUni.toFixed(2) + "<br>"
    }

    $(nomePr).html(prod)
    $(qt).html(qt1)
    $(prezzo).html(price)


    $(tr).append(nomePr)
    $(tr).append(qt)
    $(tr).append(prezzo)


    return tr;
}