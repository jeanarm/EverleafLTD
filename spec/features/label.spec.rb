# In this require, the feature required for Feature Spec such as Capybara are available.
require 'rails_helper'
# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "Label Management function", type: :feature do
 # In scenario (alias of it), write the processing of the test for each item you want to check.
 background do
   Usr.create!(name: "armel", email: 'arl@gmail.Com', admin: 'true',  password: '1234567')
   visit  root_path
   
   fill_in  'Email' ,  with: 'arl@gmail.Com'
   fill_in  'Password' ,  with: '1234567'
   click_on  'Log in'
   
 end


 scenario "Can create label" do
    @user=Usr.first
    @label = Label.create!(name: "TestLabel", content: 'testcontent',usr_id: @user.id)
    
    visit labels_path
    expect(page).to have_content('testcontent')
  end

 scenario "can search by attached labels " do
    visit new_label_path
    fill_in 'Name', with: 'label1'
    fill_in 'Content', with: 'testlabel1'
    click_on 'Create Label'
    visit new_label_path
    fill_in 'Name', with: 'label2'
    fill_in 'Content', with: 'testlabel2'
    click_on 'Create Label'
    @user=Usr.first
    @task = Task.create!(title: "Test", content: 'test2',status: 'In progress',usr_id: @user.id)
    @label1 = Label.first
     @label2 = Label.last
     @task.labels = [@label1,@label2]
    @task.save
    visit tasks_path
    fill_in  'key' ,  with: 'label1'
    click_on 'Search'
    expect(page).to have_content('test2')
  end




end

