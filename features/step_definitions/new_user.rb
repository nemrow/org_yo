include ApplicationHelper

Given(/^I am not signed in$/) do
end

When(/^I get to the homepage$/) do
	visit root_path
end

Then(/^I should click the signup button$/) do
	click_link('Sign Up')
end

Then(/^it should take me to the signup page$/) do
	page.should have_content('Sign Up')
end

Given(/^I am not a user$/) do
  visit new_user_path
end

When(/^I fill in correct info$/) do
  fill_in('First Name', :with => 'Jordan')
  fill_in('Last Name', :with => 'Nemrow')
  fill_in('Email', :with => 'nemrowj@nemrow.com')
  fill_in('Password', :with => 'password')
end

Then(/^I should be added to the database$/) do
  user_count = User.count
  click_button('submit')
  expect(User.count).to eq(user_count+1)
end

Then(/^taken to the user homepage$/) do
  page.should have_content('Jordan')
end

When(/^I click 'logout'$/) do
  click_link('signout')
end

Then(/^I should not be logged in$/) do
  page.should have_content('Sign Up')
end