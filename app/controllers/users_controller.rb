class UsersController < ApplicationController
  before_action :set_organization, except: [:destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users.json
  def index
    @users = @organization.users
    render json: @users, status: :ok, organization_id: @organization.id
  end

  # GET /users/1.json
  def show
    render json: @user, status: :ok
  end

  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1.json
  def destroy
    @user.destroy
    head :no_content
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit[:organization_id, user_organizations_attributes: [:id, :role]]
  end

  def set_organization
    @organization = Organization.find(params[:organization_id])
  end
end
