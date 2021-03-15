function constractCard(obj){

    let tr = $('<tr>')

    let codice = $('<th scope="row">')
    let marca = $('<td id="marca">')
    let nome = $('<td id="nome">')
    let descrizione = $('<td id="descrizione">')
    let prezzo = $('<td id="prezzo">&euro;</td>')
    let qt = $('<td id="qt">')
    let container = $('<td>')
    let container1 = $('<td>')
    let btn = $('<button class="btn btn-primary btn-sm">Elimina</button>')

    let edit = $('<button class="btn btn-primary btn-sm" id="submit" data-toggle="modal" data-target="#exampleModal">Edit</button>')

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

$('#exampleModal').on('hidden.bs.modal', function (e) {
    $('.modal-body').empty()
})

var tr;

function editing(){

    tr = $(this).parent().parent()

    $.get("ModificaProdottoServlet", {codiceTel: this.id}, function (obj){

        let m = $('<input type = "text" class="form-control" name = "marca">')
        let n = $('<input type = "text" class="form-control" name = "nome">')
        let d = $('<textarea cols="40" row="20" class="form-control" name = "descrizione">')
        let p = $('<input type = "text" class="form-control" name = "prezzo">')
        let q = $('<input type = "text" class="form-control" name = "qt">')

        $(m).val(obj.marca)
        $(n).val(obj.nome)
        $(d).val(obj.descrizione)
        $(p).val(obj.prezzo)
        $(q).val(obj.quantita)

        $(".modal-body").append(m)
        $(".modal-body").append(n)
        $(".modal-body").append(d)
        $(".modal-body").append(p)
        $(".modal-body").append(q)


    })

}

$('#save').click(function () {

    var marca = $('.modal-body #marca')
    console.log(marca)
    var nome = $('.modal-body #nome')
    console.log(nome)
    var descrizione = $('.modal-body #descrizione')
    console.log(descrizione)
    var prezzo =  $('.modal-body #prezzo')
    console.log(prezzo)
    var qt = $('.modal-body #qt')
    console.log(qt)

    var obj = {update : "true", marca : marca, nome : nome, descrizione : descrizione, prezzo : prezzo, qt : qt }
    console.log(obj)

    $.get("ModificaProdottoServlet",obj, function (){

        $(tr).empty()
        constractCard(obj)



    })

})

