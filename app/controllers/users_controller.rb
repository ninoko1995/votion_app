class UsersController < ApplicationController
  before_action :check_admin,only:[:index,:admin_index,:show]
  before_action :get_all_users,only:[:index,:admin_index]

  def new
    @user=User.new
  end

  def create
    if User.find_by(name: params[:session][:name]).blank?
      @user=User.new(name: params[:session][:name])
      if @user.valid?
        @user.save
        log_in @user
        redirect_to new_investment_path
      else
        redirect_to new_user_path,warning:"正しい番号を入力してください"
      end
    else
      @user = User.find_by(name: params[:session][:name])
      log_in @user
      if @user.admin == true
        redirect_to candidates_path
      else
        redirect_to end_url,success:"すでに投票いただきました。"
      end
    end
  end

  def end
  end

  def index
  end

  def admin_index
  end


  def show
    @user = User.find(params[:id])
    @investments = @user.investments.order(money: :desc)
  end

  # def edit
  # end 
  
  # def update
  # end

  # def destroy
  # end

  private
    def user_params
      params.require(:session).permit(:name)
    end

    def get_all_users
      @users = User.order(:name)
    end


end
