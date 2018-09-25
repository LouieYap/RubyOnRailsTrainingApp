$(document).ready(function() {
    //var prompt = $(this).has('option[value=]').size() ? $(this).find('option[value=]') : $('<option value=\"\">').text('Select a state');
    var prompt = '<option>Select a state</option>';

    $('#register_country').on('change', function () {
        if(this.value){
            $.ajax({
                type:'GET',
                url: '/registers/loadStates/' + this.value,
                data: $(this).serialize(),
                success: function(data){
                    $('#register_state').empty().append(prompt);
                    $.each(data, function (i, state) {
                        $('#register_state').append($('<option>').attr('value', state['id']).text(state['name']));
                    });
                    $('#register_state').attr('disabled', false);
                },
                error: function(data){
                    alert('error' + data.responseText);
                },
                dataType: 'json'
            });
        }
        else{
            $('#register_state').empty();
            $('#register_state').attr('disabled', 'disabled');
        }
        
    });

    $('#register_date_of_birth').datepicker();
});


