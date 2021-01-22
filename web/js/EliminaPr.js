function constractCard(obj){

    let tr = $('<tr>')

    let codice = $('<th scope="row">')
    let marca = $('<td id="marca">')
    let nome = $('<td id="nome">')
    let descrizione = $('<td id="descrizione">')
    let prezzo = $('<td id="prezzo">&euro;')
    let qt = $('<td id="qt">')
    let container = $('<td>')
    let container1 = $('<td>')
    let btn = $('<button class="btn btn-primary btn-sm">Elimina</button>')
    let edit = $('<button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#exampleModal">Edit</button>')

    $(codice).html(obj.codiceTel)
    $(marca).html(obj.marca)
    $(nome).html(obj.nome)
    $(descrizione).html(obj.descrizione)
    $(prezzo).html(obj.prezzo)
    $(qt).html(obj.quantita)
    $(btn).attr("id",obj.codiceTel)
    $(btn).click(listener)
    $(edit).attr("id",obj.codiceTel)
    $(edit).click(editing)


    $(tr).append(codice)
    $(tr).append(marca)
    $(tr).append(nome)
    $(tr).append(descrizione)
    $(tr).append(prezzo)
    $(tr).append(qt)
    $(container).append(btn)
    $(container1).append(edit)
    $(tr).append(container)
    $(tr).append(container1)


    return tr;

}

function listener(){
    let btn = this;
    var result = confirm("Desideri eliminare questo prodotto?")
    if(result === true) {
        $.post("EliminaProdottoServlet", {codiceTel: this.id}, function () {
            let td = $(btn).parent()
            let tr = $(td).parent()
            $(tr).remove()
        })
    }
}

function editing(){
    var myModal = document.getElementById('myModal')
    var myInput = document.getElementById('myInput')

    myModal.addEventListener('shown.bs.modal', function () {
        myInput.focus()
    })

}