$("#delivery").change(function() {
    let id = $(this).val();
    $("div[id='delivers']").css('display','none');
    $("h4[name='delivers']").css('display','none');
    let price= document.querySelector("#productprice").getAttribute("value");
    console.log(parseInt(price.replace(/\D/g, '')));
    if (id == "Курьером")
    {
        $("h4[name='delivers']").css('display','block')
        $("div[id='delivers']").css('display','block');
        $("h4[id='total']").text("Итого: "+(parseInt(price.replace(/\D/g, ''))+20)+" BYN");
        $("#price").attr("value",parseInt(price.replace(/\D/g, ''))+20);
    }
    else {
        $("h4[id='total']").text("Итого: "+parseInt(price.replace(/\D/g, ''))+" BYN");
        $("#price").attr("value",parseInt(price.replace(/\D/g, '')));
    }
});