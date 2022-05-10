class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get "/bakeries" do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get "/bakeries/:id" do
    bakery = Bakery.all.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get "/baked_goods/by_price" do
    bg_prices_decr = BakedGood.all.order("price DESC")
    bg_prices_decr.to_json
  end

  get "/baked_goods/most_expensive" do
    most_expensive = BakedGood.all.order("price DESC").take(1)[0]
    most_expensive.to_json
  end

end
