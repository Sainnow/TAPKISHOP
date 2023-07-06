$(window).on('load', function() {
    if ($("#cardproduct").length){

        $("#order").css('display','block');
        console.log("1")
    }
    else {
        $("#noorder").css('display','block');
        console.log("2")
    }
});