class AddRefToLabels < ActiveRecord::Migration[5.2]
  def change
    add_reference :labels, :usr, foreign_key: true
  end
end
