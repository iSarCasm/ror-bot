require 'sinatra'
require "sinatra/json"
require 'sinatra/activerecord'

current_dir = Dir.pwd
Dir["#{current_dir}/models/*.rb"].each { |file| require file }






post '/games' do
  p params
  render json: {status: :ok}
end

get '/games/:id' do
  p params
  render json: {
    status: :ok,
    move_from: [0,2],
    move_to: [0,3]
  }
end

put '/games/:id'
  p params
  render json: {status: :ok}
end

delete '/games/:id' do
  p params
  render json: {status: :ok}
end



# get '/' do
#   {
#     x: [1, 2 ,3],
#     z: {
#       y: "lol"
#     }
#   }.to_json
# end
#
# post '/games' do
#   json Game.create(title: params[:title] + rand(100).to_s, number: params[:number])
# end
#
# get '/games/:id' do
#   json Game.find(params[:id])
# end
