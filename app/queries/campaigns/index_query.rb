module CampaignQuery
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

  def get_query(sorter = "id ASC")
    @query = Campaign.select(
      "name",
      "next_session"
    ).order(sorter)

    @query = @query.map do |entry|
      {
        name: entry.name,
        next_session: entry.next_session,
      }.values
    end
  end
end
