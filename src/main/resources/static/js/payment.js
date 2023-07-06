$("#payment").change(function() {
    let id = $(this).val();
    $("div[id='payments']").css('display','none');
    if (id == "По карте")
    {
        $("div[id='payments']").css('display','block');
    }
});