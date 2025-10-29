require 'rails_helper'

RSpec.describe 'Plots API' do
  it 'can get the plot information by the id' do
    garden = Garden.create!(name: "Frank Garden", organic: true)
    plot = garden.plots.create!(size: "small", direction: "West")
    rose = plot.plants.create!(name: "rose", description: "red and lovely", days_to_harvest: 8)
    lily = plot.plants.create!(name: "lily", description: "yellow maybe", days_to_harvest: 10)
    basil = plot.plants.create!(name: "basil", description: "tasty and smells great", days_to_harvest: 5)


    get "/api/v1/plots/#{plot.id}"

    expect(response).to be_successful

    returned_plot = JSON.parse(response.body, symbolize_names: true)

    expect(returned_plot).to have_key(:data)
    expect(returned_plot[:data]).to have_key(:id)
    expect(returned_plot[:data]).to have_key(:type)
    expect(returned_plot[:data][:type]).to eq("plot")

    expect(returned_plot[:data][:attributes]).to have_key(:size)
    expect(returned_plot[:data][:attributes][:size]).to eq(plot.size)
    expect(returned_plot[:data][:attributes]).to have_key(:direction)
    expect(returned_plot[:data][:attributes][:direction]).to eq(plot.direction)
    expect(returned_plot[:data][:attributes]).to have_key(:garden_id)
    expect(returned_plot[:data][:attributes][:garden_id]).to eq(plot.garden_id)
    expect(returned_plot[:data][:attributes]).to have_key(:plant_list)
    expect(returned_plot[:data][:attributes][:plant_list]).to eq([rose.name, lily.name, basil.name])
  end
end