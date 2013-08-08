Given(/^on a project page$/) do
 sign_up
 create_project
 page.should have_content('My First Project')
end

When(/^I change the title$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^it updates the project$/) do
  pending # express the regexp above with the code you wish you had
end