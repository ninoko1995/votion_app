class InvestmentsController < ApplicationController
  before_action :check_log_in, only:[:new,:like]

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
        candidate.investments.create(user_id: current_user.id,money: params[:investment][:"#{candidate.name}"].to_i)
      end
      #binding.pry
      redirect_to likes_path
    end
  end

  def like
    @candidates=Candidate.all
    @like = Like.new
  end

  def like_set
    if params[:like][:candidate].count != 1
      redirect_to likes_path
    else
      current_user.likes.create(candidate_id: params[:like][:candidate])
      redirect_to end_path
    end
  end

  
end