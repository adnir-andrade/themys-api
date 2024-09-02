require_relative "../queries/campaigns/index_query"

class CampaignsReportController < ReportsController
  def index
    data = CampaignQuery::sort_data(@sorter)
    headers = ['Name', 'Next Session']
    title = "Campaigns"
    generate_report("campaigns", data, headers, title)
  end
end