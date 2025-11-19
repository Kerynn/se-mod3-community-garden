require 'rails_helper'

RSpec.describe 'Plot Plants API' do
    it 'can add a plant to a plot' do
    garden = Garden.create!(name: "Frank Garden", organic: true)
    plot = garden.plots.create!(size: "small", direction: "West")
    thyme = Plant.create(name: "thyme", description: "smells great but no time!", days_to_harvest: 2)
    
    expect(plot.plants.empty?).to be true

    headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    body = { plant_id: thyme.id, num_seedlings: 4 }
    post "/api/v1/plots/#{plot.id}/plants", params: body.to_json, headers: headers

    expect(response).to be_successful
    expect(response).to have_http_status(201)
    expect(plot.plants.empty?).to be false

    success_response = JSON.parse(response.body, symbolize_names: true)

    expect(success_response).to be_a(Hash)
    expect(success_response).to have_key(:success)
    expect(success_response[:success]).to eq("Plant added to plot successfully")
  end

end