def sign_up
  visit new_user_path
  fill_in('First Name', :with => 'Jordan')
  fill_in('Last Name', :with => 'Nemrow')
  fill_in('Email', :with => 'nemrowj@nemrow.com')
  fill_in('Password', :with => 'password')
  click_button('submit')
end

def create_project
  visit new_project_path
  fill_in('project[name]', :with => 'My First Project')
  click_button('save new project')
end