var EditProject = {
  init: function(){
    $('.updatable_project_data').change(function(){
      var project_id = $(this).data('project-id')
      EditProject.update_project_data_in_db(project_id);
    });
  },
  get_project_data: function(){
    return {
      project_data: {
        name: $('.project_title').val()
      }
    }
  },
  update_project_data_in_db: function(project_id){
    $.ajax({
      url: '/projects/'+project_id,
      type: 'PUT',
      data: EditProject.get_project_data(),
      dataType: 'json'
    }).done(function(data){
      // on success
    }).fail(function(){
      // on fail
    });
  }
}