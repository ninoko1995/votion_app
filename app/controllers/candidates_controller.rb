class CandidatesController < ApplicationController
  before_action :check_admin,only:[:index]
  
  # def new
  # end

  # def show
  # end

  def index
    @candidates=Candidate.all.order(:id)
  end
  
end
