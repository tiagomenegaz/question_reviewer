class PagesController < ApplicationController
  def home
    authorize :page
  end
end
