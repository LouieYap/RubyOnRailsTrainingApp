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

        $.ajax({
            type:'GET',
            url: '/registers/loadStates/2',
            //data: {countryId: this.value},
            success: function(data){
                alert('success' + data.responseText);
            },
            error: function(data){
                alert('error' + data.responseText);
            },
            dataType: 'json'

        });
        
    })
})