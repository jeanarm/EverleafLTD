require 'rails_helper'

# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "Task management function", type: :feature do
  # In scenario (alias of it), write the processing of the test for each item you want to check
  background  do
    User.create!(name: "Armel", email: 'ni@gmail.Com',  password: '1234567')
    User.create!(name: "Nina", email: 'na@gmail.Com',  password: '1234567')
    
end
scenario "Test task list" do
    visit  root_path
    fill_in  'Email',  with: 'ni@gmail.Com'
    fill_in  'Password' ,  with: '1234567'
    click_on  'Log in'
    expect(page).to have_text('Signed in successfully.')
    visit  new_task_path
    fill_in  'Title' ,  with: 'grettings'
    fill_in  'Content' ,  with: 'testtest'
    click_on 'Create Task'
    expect(page).to have_content 'testtest'
end

  # visit to tasks_path (transition to task list page)
 # visit tasks_path

  # write a test to verify that the string "" testtesttest "" samplesample "is included when accessing the task list page using have_content method

  scenario "Test task creation" do
    visit  root_path 
    fill_in  'Email',  with: 'na@gmail.Com'
    fill_in  'Password',  with: '1234567'
    click_on  'Log in'
    expect(page ).to have_text('Signed in successfully.') 
   visit  new_task_path
    fill_in  'Title' ,  with: 'grettings' 
    fill_in  'Content' ,  with: 'testtesttest'
    click_on 'Create Task'
    expect(page).to have_text('Task was successfully created.')
  end
  scenario "Test task details" do
    visit  root_path 
    fill_in  'Email',  with: 'na@gmail.Com'
    fill_in  'Password',  with: '1234567'
    click_on  'Log in'
    expect(page ).to have_text('Signed in successfully.') 
   visit  new_task_path
    fill_in  'Title' ,  with: 'grettings' 
    fill_in  'Content' ,  with: 'test'
    click_on 'Create Task'
    click_on 'Back'
    click_on 'Show'
    expect(page).to have_text('test')

  end
     
  scenario 'task must be true' do
   
    visit  root_path 
    fill_in  'Email',  with: 'na@gmail.Com'
    fill_in  'Password',  with: '1234567'
    click_on  'Log in'
    expect(page ).to have_text('Signed in successfully.') 
   visit  new_task_path
    fill_in  'Title' ,  with: ' ' 
    fill_in  'Content' ,  with: 'test'
    click_on 'Create Task'
    expect(page).to have_text('1 error prohibited this task from being saved:')

  end
  end


