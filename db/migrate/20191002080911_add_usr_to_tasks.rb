class AddUsrToTasks < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :usr, foreign_key: true
  end
end
