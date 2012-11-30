jQuery ->
   $(".new_comment, .edit_comment").live 'submit', ->
     if !$('.new_comment').attr('action').match("obs")
       request.success = $.post
       request.success(data) ->
         $(".new_comment #rich_content, .edit_comment #rich_content").val("")
         $(".new_comment .redactor_editor, .edit_comment .redactor_editor").text("")

