class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :content
      t.date :expired_date
      t.integer :priority, default: 0
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
