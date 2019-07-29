class Question < ApplicationRecord
  belongs_to :sub_category

  validates :statement, presence: true
  validates :explanation, presence: true
  validates :question_number, presence: true
  validates :question_branch_number, presence: true
end
