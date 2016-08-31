class InvestmentsController < ApplicationController
  def new
    @investment=Investment.new
    @candidates=Candidate.all
  end

  def create
    @candidates=Candidate.all
    @sum_investment = 0
    @candidates.each do |candidate|
      if params[:investment][:"#{candidate.name}"].blank?
        params[:investment][:"#{candidate.name}"]="0"
      end
      @sum_investment += params[:investment][:"#{candidate.name}"].to_i
    end
  
    if @sum_investment > 100
      flash.now[:danger]="投資できるのは合計100万円までです。"
      redirect_to new_investment_path
    else
      @candidates.each do |candidate|
        @investment=Investment.new
        @investment.attributes = {:money => params[:investment][:"#{candidate.name}"].to_i,:candidate_id => candidate.id}
        # @investment.user_id=current_user.id
        @investment.save
      end
      binding.pry
      redirect_to users_end_path
    end
  end

  def edit
  end

  def index
    @candidates=Candidate.all
    @candidates.each do |candidate|
      @investments = Investment.where(candidate_id: candidate.id)
      @investments.each do |investment|
        candidate.money += investment.money
      end
    end
  end
end