class InvestmentsController < ApplicationController
  before_action :check_log_in, only:[:new,:create,:edit,:update]
  before_action :set_candidates,only:[:new,:create,:edit,:update,:calculate_sum]
  before_action :set_user,only:[:edit,:update]
  def new
    if Investment.where(user_id: current_user.id).empty? 
      @investment=Investment.new
    elsif
      redirect_to edit_investment_path(current_user)
    end
  end

  def create 
    if calculate_sum > 100
      redirect_to new_investment_url,warning:"投資できるのは合計100万円までです。"
    else
      @candidates.each do |candidate|
        candidate.investments.create(user_id: current_user.id,money: params[:investment][:"#{candidate.name}"].to_i)
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

  # def like_set
  #   # binding.pry
  #   current_user.likes.create(candidate_id: params[:like][:candidate].to_i)
  #   @candidate = Candidate.find(params[:like][:candidate].to_i)
  #   @candidate.liking+=1
  #   @candidate.save
  #   redirect_to end_url
  # end

   def edit
    @investment = Investment.new
    @investments = @user.investments.order(id: :asc)
  end 
  
  def update
    if calculate_sum > 100
      redirect_to new_investment_url,warning:"投資できるのは合計100万円までです。"
    else
      @candidates.each do |candidate|
        candidate.investments.find_by(user_id: params[:id]).update(money: params[:investment][:"#{candidate.name}"].to_i)
      end
      redirect_to end_url
    end
  end

  private
   
    def calculate_sum
      @sum_investment = 0
      @candidates.each do |candidate|
        @sum_investment += params[:investment][:"#{candidate.name}"].to_i
      end
      return @sum_investment
    end

    def set_candidates
      @candidates = Candidate.all.order(:id)
    end

    def set_user
      @user = User.find_by(id: params[:id])
    end
end