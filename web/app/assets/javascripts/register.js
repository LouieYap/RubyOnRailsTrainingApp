$(document).ready(function() {
    $('select').on('change', function () {
        /*
        $.ajax({
            type: 'GET',
            xhrFields: {
                withCredentials: true
            },
            dataType: 'json',
            url: '/registers/loadStates',
            data: {id:this.value},
            success: function(response){
                alert(response);
            }
        })
        */

        $.get('/registers/loadStates', {countryId: this.value}, function (data) {
            alert(data);
        });
        
    })
})