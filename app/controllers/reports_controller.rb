require_relative "../queries/campaigns_players/character_player_by_campaign"

class ReportsController < ApplicationController
  before_action :set_sorter

  def generate_report(filename, data, headers, title)
    respond_to do |format|
      format.pdf do
        pdf = BasePdf.new(data: data, headers: headers, title: title)
        pdf.render_document
        send_data(pdf.render, filename: "#{filename}.pdf", type: 'application/pdf', disposition: "inline"
        )
      end
    end
  end

  def set_sorter
    @sorter = params[:option]
  end

  def character_player_by_campaign
    data = CharacterPlayerByCampaign::sort_data(@sorter)
    headers = ['Username', 'Campaign', 'Character']
    title = "Player's character by campaign"
    generate_report("player-character-by-campaign", data, headers, title)
  end
end