function show_result(data) {
    let result = document.getElementById('result')
    result.innerHTML = ""
    if (typeof data.originalEvent.detail[0].value == 'string')
        result.innerHTML += data.originalEvent.detail[0].value
    else
        data.originalEvent.detail[0].value.forEach(elem => {
            result.innerHTML += elem.join(': ') + "<br>"
    })
}

jQuery(function($) {
    $("#arm_form").bind("ajax:success", function(data) { show_result(data)})
    console.log("Ok")
});
