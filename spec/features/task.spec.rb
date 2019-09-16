require 'rails_helper'

# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "Task management function", type: :feature do
  # In scenario (alias of it), write the processing of the test for each item you want to check
  background  do
    User.create!( email: 'na@gmail.Com',  password: '1234567', name: "Armel" )
end
scenario "Test task list" do
    visit  root_path
    fill_in  'Email' ,  with: 'na@gmail.Com'
    fill_in  'Password' ,  with: '1234567'
    click_on  'Log in'
    expect(page ).to have_text('Signed in successfully.')
    click_on 'New Task'
    fill_in  'Tittle' ,  with: 'grettings'
    fill_in  'Content' ,  with: 'testtest'
    click_on 'Create Task'
    expect(page).to have_content 'testtest'
end

  # visit to tasks_path (transition to task list page)
  visit tasks_path

  # write a test to verify that the string "" testtesttest "" samplesample "is included when accessing the task list page using have_content method



  end

  scenario "Test task creation" do

  end

  scenario "Test task details" do

  end
end