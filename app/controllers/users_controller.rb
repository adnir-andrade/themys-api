# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/:id
  def show
    render json: @user
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  def create
    @form = User::CreateForm.new(user_params)
    if @form.save
      render json: @form.user, status: :created
    else
      render json: @form.errors, status: :unprocessable_entity
    end
  end

  # GET /users/:id/edit
  def edit
  end

  # PATCH/PUT /users/:id
  def update
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    head :no_content
  end

  private

  # Método Set para deixar usuário com acesso global dentro do Controller.
  def set_user
    @user = User.find(params[:id])
  end

  # Método utilizado para garantir que sejam passados apenas determinados parâmetros
  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
