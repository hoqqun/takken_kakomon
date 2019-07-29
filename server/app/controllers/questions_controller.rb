class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to questions_path
    else
      @questions = Question.all
      render "index"
    end
  end

  private

  def question_params
    params.require(:question).permit(
      :statement,
      :explanation,
      :correctness,
      :question_number,
      :question_branch_number,
      :sub_category_id, :year
    )
  end
end
