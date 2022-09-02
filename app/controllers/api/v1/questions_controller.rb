class Api::V1::QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :update, :destroy]

  # GET /api/v1/questions
  def index
    @questions = Question.all

    render json: @questions
  end

  # GET /api/v1/questions/1
  def show
    render json: @question
  end

  # POST /api/v1/questions
  def create
    @question = Question.new(question_params)

    if @question.save
      render json: @question, status: :created
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/questions/1
  def update
    if @question.update(question_params)
      render json: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/questions/1
  def destroy
    @question.destroy

    render status: :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def question_params
      params.require(:question).permit(:title, :body)
    end
end
