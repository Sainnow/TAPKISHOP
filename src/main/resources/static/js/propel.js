var sel = document.getElementById('file1')
var classname = document.getElementById('classname')
const input = document.getElementsByClassName('inputP')// HTML-collection
const property = document.getElementsByName('property')
sel.addEventListener('click', function (e) {
    let valueClassname=classname.value;
    console.log(valueClassname);
    let length = input.length;
    let sum;
    console.log("длина input"+"  "+length)
    console.log(sum+" сума ")
    for (let i = 0; i < length; i++) {
        console.log("Начало цыкла")
        console.log(input[i].getAttribute('name')+"  значение элемента");
        if(input[i].getAttribute('name') != valueClassname)
        {
            console.log(i+"    удалено");
            input[i].remove();
            property[i].remove();
            i--;
        }
    }
});