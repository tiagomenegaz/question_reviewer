module Questions
  class ReviewsController < ApplicationController
    before_action :set_question, only: [:analyses, :approve]

    def analyses
      authorize @question
    end

    def approve
      authorize @question

      if @question.update(update_params)
        redirect_to questions_path, notice: 'Question was successfully approved.'
      else
        redirect_to questions_path, alert: 'Error when approving question.'
      end
    end

    private
    
    def set_question
      @question = Question.find(params[:id])
    end

    def update_params
      { pending_at: nil, approved_at: Time.now }
    end
  end
end
