class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    authorize Question
    @questions = policy_scope(Question).joins(:user)
  end

  def show
    authorize @question
  end

  def new
    authorize Question
    @question = Question.new
  end

  def edit
    authorize @question
  end

  def create
    authorize Question
    @question = Question.new(question_create_params)

    if @question.save
      redirect_to questions_url, notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  def update
    authorize @question

    if @question.update(question_params)
      redirect_to questions_url, notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @question

    @question.destroy
    redirect_to questions_url, notice: 'Question was successfully destroyed.'
  end

  private
  
  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:content, :source, :year)
  end

  def question_create_params
    question_params.merge(user: current_user, pending_at: Time.now)
  end
end
