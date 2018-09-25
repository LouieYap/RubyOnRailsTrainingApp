$(document).ready(function() {
    //var prompt = $(this).has('option[value=]').size() ? $(this).find('option[value=]') : $('<option value=\"\">').text('Select a state');

    $('#register_country').on('change', function () {
        $.ajax({
            type:'GET',
            url: '/registers/loadStates/' + this.value,
            data: $(this).serialize(),
            success: function(data){
                $('#register_state').empty();//.append(prompt);
                $.each(data, function (i, state) {
                    $('#register_state').append($('<option>').attr('value', state['id']).text(state['name']));
                    $('#register_state').attr('disabled', false);
                });
            },
            error: function(data){
                alert('error' + data.responseText);
            },
            dataType: 'json'
        });
        
    })
})