function constractCard(obj){

    let tr = $('<tr>')

    let email = $('<td id="email">')
    let nome = $('<td id="nome">')
    let cognome = $('<td id="cognome">')

    let container = $('<td>')
    let btn = $('<button class="btn btn-primary btn-sm">Elimina</button>')

    $(email).html(obj.email)
    $(nome).html(obj.nome)
    $(cognome).html(obj.cognome)
    $(btn).attr("id",obj.email)
    $(btn).click(listener)


    $(tr).append(email)
    $(tr).append(nome)
    $(tr).append(cognome)
    $(tr).append(btn)
    $(container).append(btn)
    $(tr).append(container)

    return tr;

}

function listener(){
    let btn = this;
    var result = confirm("Desideri eliminare questo utente?")
    if(result === true) {
        $.post("EliminaUtenteServlet", {email: this.id}, function () {
            let td = $(btn).parent()
            let tr = $(td).parent()
            $(tr).remove()

        })
    }
}