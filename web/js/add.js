function constractCard(obj){

    let row = $('<div class="row">')
    let col = $('<div class="col-md-7">')
    let container = $('<div class="container">')
    let a =$('<a>')
    let img = $('<img class="img-fluid rounded mb-3 mb-md-0">')
    let div = $(' <div class="col-md-5">')
    let h2 = $('<h2>')
    let h1 = $('<h1 class="my-4">')
    let p = $('<p>')
    let btn = $(' <button type="button" class="btn btn-primary mb-2 ripple-surface" id="'+obj.codiceTel+'" data-toggle="modal" data-target="#exampleModal">Visualizza</button>')


    /*ProductCard*/
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

$('#exampleModal').on('show.bs.modal', function (e){

    let codiceTel = $(e.relatedTarget).attr("id")

    $.get("ModificaProdottoServlet", {codiceTel : codiceTel}, function (obj){
        for(i = 1; i<=obj.quantita; i++){
            $("#qt").append('<option value="'+i+'">'+i+'</option>')
        }
        $(".modal-title").append(obj.nome)
        $("#prezzo").append(obj.prezzo)
        $("#codiceTel").val(codiceTel)

    })



})


$('#exampleModal').on('hidden.bs.modal', function (e){
    $(".modal-title").empty()
    $("#qt").empty()
    $("#prezzo").empty()
})

$("#add").click(function (){

    $.post("AsyncCartServlet",{op : add, codiceTel: $("#codiceTel").val(), qt : $("#qt").val()}, function (){
        $("#exampleModal").modal("hide")
    })
})
