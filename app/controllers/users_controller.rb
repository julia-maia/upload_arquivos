class UsersController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]


  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      start_new_session_for(@user)
      redirect_to after_authentication_url, notice: "Usuário Criado com Sucesso!"
    else
      render action: :new, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:nome, :email_address, :password, :password_confirmation)
  end
end