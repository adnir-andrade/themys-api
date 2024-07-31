class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :edit, :update, :destroy]

  def index
    @campaigns = Campaign.all

    render json: @campaigns, adapter: :json
  end

  def show
    render json: @campaign, adapter: :json
  end

  def new
    @campaign = Campaign.new
  end

  def create
    form = Campaign::CreateForm.new(campaign_params)

    if form.create
      render json: form, status: 201, location: @campaign
    else
      render json: form.errors, status: 422
    end
  end

  def edit
    puts "To be defined"
  end

  def update
    if @campaign.update(campaign_params)
      render json: @campaign
    else
      render json: @campaign.errors, status: 422
    end
  end

  def destroy
    render json: @campaign.destroy, status: 200
  end

  private

  def set_campaign
    @campaign = Campaign.find(campaign_params[:id])
  end

  def campaign_params
    campaign_params.require(:campaign).permit(:dm_id, :name, :next_session)
  end
end
