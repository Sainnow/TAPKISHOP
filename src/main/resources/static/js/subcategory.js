$("#typename").change(function() {
    if ($(this).data('options') === undefined) {
        $(this).data('options', $('#classname option ').clone());}
    let id = $(this).val();
    let options = $(this).data('options').filter('[id=' + id + ']');
    $('#classname').html(options).prepend('<option value="">Не выбрано</option>');
    $('#classname option:first').prop('selected', true);
});