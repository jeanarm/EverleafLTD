class AddContentToLabels < ActiveRecord::Migration[5.2]
  def change
    add_column :labels, :content, :string
  end
end
