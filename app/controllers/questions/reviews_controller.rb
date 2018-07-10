module Questions
  class ReviewsController < ApplicationController
    before_action :set_question, only: [:analyses, :approve, :comment, :reprove]

    def analyses
      authorize @question
    end

    def approve
      authorize @question

      if @question.update(approve_params)
        redirect_to questions_path, notice: 'Question was successfully approved.'
      else
        redirect_to questions_path, alert: 'Error when approving question.'
      end
    end

    def comment
      authorize @question
    end

    def reprove
      authorize @question

      if @question.update(reprove_params)
        redirect_to questions_path, notice: 'Question was successfully reproved.'
      else
        redirect_to questions_path, alert: 'Error while reproving question.'
      end
    end

    private
    
    def set_question
      @question = Question.find(params[:id])
    end

    def approve_params
      { pending_at: nil, approved_at: Time.now }
    end

    def reprove_params
      { pending_at: nil, reproved_at: Time.now }
    end
  end
end
