Given(/^I am logged in$/) do
  visit login_path
  fill_in('user[email]', :with => 'nemrowj@gmaill.com')
  fill_in('user[password]', :with => 'password')
  click_button('Login')
end

When(/^I get to the user index page$/) do
  page.should have_content('')
end

Then(/^I should click the 'new project' button$/) do
  click_link('New Project')
end

Then(/^it should take me to the new project page$/) do
  page.should have_content('New Project')  
end

Given(/^on the new project page$/) do
  visit new_project_path
end

When(/^I enter accurate new project data$/) do
  fill_in('project[name]', :with => 'My First Project')
end

When(/^enter click the 'save new project' button$/) do
  click_button('save new project')
end

Then(/^I it should take me the project edit page$/) do
  page.should have_content('My First Project')
end