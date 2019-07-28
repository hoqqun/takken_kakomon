class AddForeignKeyToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :sub_category, foreign_key: true
  end
end
