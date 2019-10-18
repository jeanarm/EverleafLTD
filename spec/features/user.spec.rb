# In this require, the feature required for Feature Spec such as Capybara are available.
require 'rails_helper'
# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "user management function", type: :feature do
 # In scenario (alias of it), write the processing of the test for each item you want to check.
 background do
   Usr.create!(name: "armel", email: 'arl@gmail.Com', admin: 'true',  password: '1234567')
   visit  root_path
   
   fill_in  'Email' ,  with: 'arl@gmail.Com'
   fill_in  'Password' ,  with: '1234567'
   click_on  'Log in'
   
 end
 scenario "Test number of users" do
   Usr.create!(name: 'Nina', email: 'nina@gmail.com', admin: 'true', password: '1234567')
   @user = Usr.all.count
   expect(@user).to eq 2
 end
 scenario "Test user list" do
   Usr.create!(name: 'Yves', email: 'armel@gmail.com', admin: 'true', password: '1234567')
   visit admin_usrs_path
   expect(page ).to  have_content  'armel'
   expect(page ).to  have_content  'Yves'
 end
 scenario "Test user creation" do
   Usr.create!(name: 'Josiane', email: 'jo@gmail.com', admin: 'true', password: '1234567')
   visit admin_usrs_path
   expect(page ).to  have_content  'Josiane'
 end
 scenario "test enable user creation page" do
   visit admin_usrs_path
   expect(page ).to  have_content  'armel'
 end
 scenario "Test user details" do
   @user= Usr.create!(name: 'Arma', email: 'a@gmail.com', admin: 'true', password: '1234567')
   visit admin_usr_path(id: @user.id)
   expect(page).to have_content('a@gmail.com')
   expect(page).to have_content('true')
 end
 
 scenario 'Test User Deletion' do
   Usr.create!(name: 'mentor', email: 'm@gmail.com', admin: 'true', password: '123456')
   @user = Usr.last
   @user.destroy
   # expect(page).to have_content('testtesttest')
   # click_on 'Destroy'
   visit usrs_path
   expect(page).not_to have_content('mentor')
 end
 scenario "Admin can create and manage user" do
    visit new_admin_usr_path
    Usr.create!(name: 'Nina', email: 'na@gmail.com', admin: 'true', password: '1234567')
    visit  admin_usrs_url
   
  expect(page).to have_text('Nina')
  
end
end

