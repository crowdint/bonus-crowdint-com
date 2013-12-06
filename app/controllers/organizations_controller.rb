class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :update, :destroy]

  # GET /organizations.json
  def index
    @organizations = current_user.organizations
    render json: @organizations, status: :ok
  end

  # GET /organizations/1.json
  def show
    render json: @organization, status: :ok
  end

  # POST /organizations.json
  def create
    @organization = Organization.new(organization_params)

    if @organization.save
      render json: @organization, status: :created, location: @organization
    else
      render json: @organization.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /organizations/1.json
  def update
    if @organization.update(organization_params)
      head :no_content
    else
      render json: @organization.errors, status: :unprocessable_entity
    end
  end

  # DELETE /organizations/1.json
  def destroy
    @organization.destroy
    head :no_content
  end

  private
  def set_organization
    @organization = Organization.find(params[:id])
  end

  def organization_params
    params.require(:organization).permit(:name)
  end
end
