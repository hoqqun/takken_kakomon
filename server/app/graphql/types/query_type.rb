module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :question, Types::QuestionType, null: false do
      description "質問を1件取得する"
      argument :id, Int, required: true, description: "質問ID"
    end
    def question(id:)
      Question.find(id)
    end

    field :questions, [Types::QuestionType], null: false do
      description "質問を全件取得する"
    end
    def questions
      Question.all
    end
  end
end
