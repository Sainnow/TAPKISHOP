$("#classname").change(function() {
        let id = $(this).val();
    $("div[id='inputP']").css('display','none');
        $("div[name=" + id + "]").css('display','block');

});

