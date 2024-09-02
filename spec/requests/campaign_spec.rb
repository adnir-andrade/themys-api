require 'rails_helper'

RSpec.describe "Campaigns", type: :request do
  describe "GET /index" do
    it 'returns all campaigns' do
      create_list(:campaign, 3)

      get campaigns_path

      # formattedJson = {
      #   id: item.id,
      #   name: item.name,
      #   value: item.value,
      #   description: item.description
      # }

      responseJson = JSON.parse(response.body)

      expect(responseJson).to eq("")

    end
  end
end
