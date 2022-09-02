class Api::V1::AnswersController < ApplicationController
  before_action :set_question
  before_action :set_answer, only: [:show, :update, :destroy]

  def index
    @answers = @question.answers
    return json: @answers
  end

  def show
    render json: @answer
  end

  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      render json: @answer, status: :created
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  def update
    if @answer.update(answer_params)
      render json: @answer
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @answer.destroy

    render status: :no_content
  end

  private
    def answer_params
      params.require(:answer).permit(:body)
    end

    def set_question
      @question = Question.find(params[:question_id])
    end

    def set_answer
      @answer = Answer.find(params[:id])
    end
end
