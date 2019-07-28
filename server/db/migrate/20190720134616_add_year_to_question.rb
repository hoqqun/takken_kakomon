class AddYearToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :year, :integer
  end
end
