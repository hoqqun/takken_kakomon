class Api::V1::QuestionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: Question.all
  end

  def show
    render json: Question.find(params[:id])
  end
end
