jQuery ->
   $('input[type="submit"]').live 'click', ->
     $(this).attr('data-disable-with','loading...')
