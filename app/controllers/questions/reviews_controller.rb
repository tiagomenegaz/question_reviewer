module Questions
  class ReviewsController < ApplicationController
    before_action :set_question, only: [:analyses]

    def analyses
      authorize @question
    end

    private
    
    def set_question
      @question = Question.find(params[:id])
    end
  end
end
