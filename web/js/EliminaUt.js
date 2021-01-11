function constractCard(obj){

    let tr = $('<tr id="2">')

    let email = $('<td id="email">')
    let nome = $('<td id="nome">')
    let cognome = $('<td id="cognome">')

    let btn = $('<td><button type="submit">Elimina</button></td>')


    $(email).html(obj.email)
    $(nome).html(obj.nome)
    $(cognome).html(obj.cognome)


    $(tr).append(email)
    $(tr).append(nome)
    $(tr).append(cognome)
    $(tr).append(btn)

    return tr;

}