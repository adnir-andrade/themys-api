module CharacterPlayerByCampaign
  extend self
  attr_reader :query

  def sort_data(sorter)
    filters = {
      "name-asc" => -> { get_query("name ASC") },
      "name-desc" => -> { get_query("name DESC") },
    }

    filters.fetch(sorter, -> {
      get_query
      return @query
    }).call
  end

  private

  def get_query(sorter = "campaign_name ASC")
    @query = CampaignsPlayer.joins(:campaign, :character)
                            .joins("INNER JOIN users AS players ON campaigns_players.player_id = players.id")
                            .select(
                              "players.username as user_name",
                              "campaigns.name as campaign_name",
                              "characters.name as character_name",
                            ).order(sorter)

    @query = @query.map do |entry|
      [entry.user_name,
       entry.campaign_name,
       entry.character_name]
    end
  end
end
