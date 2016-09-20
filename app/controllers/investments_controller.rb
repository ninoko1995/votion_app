class InvestmentsController < ApplicationController
  before_action :check_log_in, only:[:new,:like]
  before_action :set_candidates,only:[:new,:create,:like]

  def new
    if Investment.where(user_id: current_user.id).empty? 
      @investment=Investment.new
    elsif
      redirect_to edit_user_path(current_user)
    end
  end

  def create
    @sum_investment = 0
    @candidates.each do |candidate|
      if params[:investment][:"#{candidate.name}"].blank?
        params[:investment][:"#{candidate.name}"]="0"
      end
      @sum_investment += params[:investment][:"#{candidate.name}"].to_i
    end
  
    if @sum_investment > 100
      redirect_to new_investment_url,warning:"投資できるのは合計100万円までです。"
    else
      @candidates.each do |candidate|
        candidate.investments.create(user_id: current_user.id,money: params[:investment][:"#{candidate.name}"].to_i)
        candidate.money+=params[:investment][:"#{candidate.name}"].to_i
        candidate.save
      end
      redirect_to end_url
    end
  end

  def like
    if Like.where(user_id: current_user.id).empty? 
      @like=Like.new
    elsif
      redirect_to end_path
    end
  end

  def like_set
    # binding.pry
    current_user.likes.create(candidate_id: params[:like][:candidate].to_i)
    @candidate = Candidate.find(params[:like][:candidate].to_i)
    @candidate.liking+=1
    @candidate.save
    redirect_to end_url
  end

  private
   
    def set_candidates
      @candidates = Candidate.all.order(:id)
    end

end