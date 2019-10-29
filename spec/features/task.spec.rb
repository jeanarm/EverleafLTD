require 'rails_helper'

# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "Task management function", type: :feature do
  # In scenario (alias of it), write the processing of the test for each item you want to check
  background  do
    Usr.create!(name: "Armel", email: 'ni@gmail.Com',password: '1234567')
    Usr.create!(name: "Nina", email: 'na@gmail.Com', password: '1234567')
    Usr.create!(name: "Yves", email: 'yv@gmail.Com',  password: '1234567')
    
end
background  do
    visit  root_path
    fill_in  'Email',  with: 'ni@gmail.Com'
    fill_in  'Password' ,  with: '1234567'
    click_on  'Log in'
    expect(page).to have_text('welcome !! You are redirected to Tasks list because you are not admin!!')
end

scenario "Test task list" do
   
    visit  new_task_path
    fill_in  'Title' ,  with: 'grettings'
    fill_in  'Content' ,  with: 'testtest'
    click_on 'Create Task'
    expect(page).to have_content 'testtest'
end

 
  scenario "Test task creation" do
  
   visit  new_task_path
    fill_in  'Title' ,  with: 'grettings' 
    fill_in  'Content' ,  with: 'testtesttest'
    click_on 'Create Task'
    expect(page).to have_text('Task was successfully created.')
  end
  scenario "Test task details" do
  
   visit  new_task_path
    fill_in  'Title' ,  with: 'grettings' 
    fill_in  'Content' ,  with: 'test'
    click_on 'Create Task'
    click_on 'Back'
    click_on 'Show'
    expect(page).to have_text('test')

  end
     
  scenario 'task must be true' do
   
   visit  new_task_path
    fill_in  'Title' ,  with: ' ' 
    fill_in  'Content' ,  with: 'test'
    click_on 'Create Task'
    expect(page).to have_text('1 error prohibited this task from being saved:')

  end


  scenario "Test whether tasks are arranged in descending order of creation date" do
  assert Task.order('created_at DESC')
 
  end


  it "Validation does not pass if the title is empty" do
    task = Task.new(title: '', content: 'Failure test')
    expect(task).not_to be_valid
  end

  it "Validation does not pass if content is empty" do
    task = Task.new(title: 'web', content: '')
    expect(task).not_to be_valid
  end

  it "validation passes If content is described in title and content" do
    
   visit  new_task_path

   fill_in  'Title' ,  with: 'Test Title' 
   fill_in  'Content' ,  with: 'test'
    click_on 'Create Task'

    
   
    expect(page).to have_text('Task was successfully created.')
  end
  it "can search" do
  
   visit  new_task_path

   fill_in  'Title' ,  with: 'Test Title' 
   fill_in  'Content' ,  with: 'test' 
   
    click_on 'Create Task'

   
    expect(page).to have_text('Task was successfully created.')

    visit tasks_path
    fill_in 'term', with: 'Test Title'
    click_on 'Find'
    expect(page).to have_content('Test')

  end

  it "Can add deadline" do

   visit  new_task_path
   visit  new_task_path

   fill_in  'Title' ,  with: 'Test Title' 
   fill_in  'Content' ,  with: 'test' 
   
    click_on 'Create Task'
   
    visit tasks_path
    expect(page).to have_content('2019-10-20')

  end

  it "Can add task priority" do

    visit  new_task_path
    visit  new_task_path
 
    fill_in  'Title' ,  with: 'Test Title' 
    fill_in  'Content' ,  with: 'test' 
    
     click_on 'Create Task'
    
     visit tasks_path
     expect(page).to have_content('low')
  end


  it "Task can be sorted by priority" do
    assert Task.order('prioriy DESC')
   
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