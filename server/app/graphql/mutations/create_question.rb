module Mutations
  class CreateQuestion < Mutations::BaseMutation
    argument :statement, String, required: true
    argument :explanation, String, required: true
    argument :question_number, Int, required: true
    argument :question_branch_number, Int, required: true
    argument :correctness, Boolean, required: true

    field :question, Types::QuestionType, null: true
    field :errors, [String], null: false

    def resolve(statement:, explanation:, question_number:, question_branch_number:, correctness:)
      question = Question.new(
        statement: statement,
        explanation: explanation,
        question_number: question_number,
        question_branch_number: question_branch_number,
        correctness: correctness
      )

      if question.save
        {
          question: question,
          errors: []
        }
      else
        {
          question: nil,
          errors: question.errors.full_messages
        }
      end
    end
  end
end
