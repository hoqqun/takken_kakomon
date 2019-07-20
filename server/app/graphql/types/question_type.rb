module Types
  class QuestionType < Types::BaseObject
    field :id, Int, null: false
    field :statement, String, null: false
    field :explanation, String, null: false
    field :correctness, Boolean, null: false
    field :question_number, Int, null: false
    field :question_branch_number, Int, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
