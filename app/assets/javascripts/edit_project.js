var EditProject = {
  init: function(){
    $('.updatable_project_data').change(function(){
      var project_id = $(this).data('project-id')
      TouchDB.update_project_data_in_db(project_id);
    });
    $('.updatable_discussion_data').change(function(){
      var discussion_id = $(this).data('discussion-id')
      TouchDB.update_discussion_in_db(discussion_id, false);
    });
    $('.discussion_shell').on('click', '.add_discussion-btn',function(e){
      e.preventDefault();
      var discussion_id = $(this).data('discussion-id')
      TouchDB.update_discussion_in_db(discussion_id);
    });
    $('.add_new_discussion_btn').click(function(e){
      e.preventDefault();
      TouchDOM.hide_add_discussion_btn();
      var project_id = $(this).data('project-id')
      TouchDB.get_new_discussion(project_id);
    });
    $('.add_response_btn').click(function(e){
      e.preventDefault();
      TouchDOM.disable($(this));
      TouchDB.get_new_discussion_response(discussion_id);
    });
    $('.add_response_shell').on('click', '.update_response_button', function(e){
      var discussion_response_id = $(this).data('discussion-response-id');
      e.preventDefault();
      TouchDOM.enable($('.add_response_btn'));
      TouchDB.update_discussion_response_in_db(discussion_response_id);
      $('.create_new_response_shell').remove();
    });
  }
}
var TouchDOM = {
  get_project_data: function(){
    return {
      project_data: {
        name: $('.project_title').val()
      }
    }
  },
  get_discussion_data: function(){
    return {
      discussion_data: {
        title: $('.discussion_title').val(),
        content: $('.discussion_content').val()
      }
    }
  },
  hide_add_discussion_btn: function(){
    $('.add_new_discussion_btn').hide()
  },
  show_add_discussion_btn: function(){
    $('.add_new_discussion_btn').show()
  },
  remove_new_discussion_shell: function(){
    $('.new_discussion_shell').remove();
  },
  append_new_discussion: function(data){
    this.remove_new_discussion_shell();
    this.show_add_discussion_btn();
    $('.discussion_shell').prepend(data);
  },
  get_discussion_response_data: function(){
    return {
      discussion_response_data: {
        content: $('.discussion_response').val()
      }
    }
  },
  hide_new_discussion_response_shell: function(){
    $('.new_discussion_response_shell').hide();
  },
  show_new_discussion_response_shell: function(){
    $('.new_discussion_response_shell').show();
  },
  append_new_discussion_response: function(data){
    $('.discussion_response_shell').prepend(data);
  },
  prepend_new_response: function(data){
    $('.add_response_shell').append(data)
  },
  remove_new_discussion_response_shell: function(){
    $('.create_new_response_shell').remove();
  },
  show_new_discussion_response_shell: function(){
    $('.create_new_response_shell').remove();
  },
  disable: function($element){
    $element.attr('disabled', 'disabled');
  },
  enable: function($element){
    $element.removeAttr('disabled');
  }
}
var TouchDB = {
  update_project_data_in_db: function(project_id){
    $.ajax({
      url: '/projects/'+project_id,
      type: 'PUT',
      data: TouchDOM.get_project_data(),
      dataType: 'json'
    }).done(function(data){
      console.log(data)
    }).fail(function(){
      console.log(data)
    });
  },
  update_discussion_in_db: function(discussion_id, first_create){
    $.ajax({
      url: '/discussions/'+discussion_id,
      type: 'PUT',
      data: TouchDOM.get_discussion_data()
    }).done(function(data){
      if (first_create != false){
        TouchDOM.append_new_discussion(data);
      };
    }).fail(function(){
      alert('fail')
    });
  },
  get_new_discussion: function(project_id){
    $.ajax({
      url: '/projects/'+project_id+'/discussions',
      type: 'POST'
    }).done(function(data){
      $('.discussion_shell').prepend(data)
    }).fail(function(){
      console.log(data)
    });
  },
  get_new_discussion_response: function(discussion_id){
    $.ajax({
      url: '/discussions/'+discussion_id+'/discussions_responses',
      type: 'POST'
    }).done(function(data){
      TouchDOM.prepend_new_response(data);
    }).fail(function(){
      console.log(data)
    });
  },
  update_discussion_response_in_db: function(discussion_response_id){
    $.ajax({
      url: /discussions_responses/+discussion_response_id,
      type: 'PUT',
      data: TouchDOM.get_discussion_response_data()
    }).done(function(data){
      TouchDOM.append_new_discussion_response(data);
    }).fail(function(){
      alert('fail')
    });
  }
}