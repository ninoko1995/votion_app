class UsersController < ApplicationController
  before_action :check_admin,only:[:index,:admin_index,:destroy]
  before_action :get_all_users,only:[:index,:admin_index]
  before_action :set_user,only:[:show,:edit]
  
  def new
    if !current_user.blank?
      log_out
    end
    @user=User.new
  end

  def create
    if User.find_by(name: params[:session][:name]).blank?
      @user=User.new(user_params)
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
        redirect_to user_path(@user)
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
    @investments = @user.investments.order(id: :asc)

    #これはもともとhtmlのほうに書いてあったやつ
    # <td><%= "★" if candidate.id == Like.find_by(user_id: investment.user_id).candidate_id  %></td>    
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to candidates_url
  end

  private
    def user_params
      params.require(:session).permit(:name)
    end

    def get_all_users
      @users = User.order(:name)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
