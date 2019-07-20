class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :statement
      t.text :explanation
      t.boolean :correctness , default: false
      t.integer :question_number
      t.integer :question_branch_number
      t.timestamps
    end
  end
end
