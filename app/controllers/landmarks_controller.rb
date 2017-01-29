class LandmarksController < ApplicationController
  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/edit'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks' do
    erb :'/landmarks/index'
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.name = params[":landmark"]["name"]
    @landmark.year_completed = params[":landmark"]["year_completed"]
    @landmark.save

    erb :'/landmarks/show'
  end

  post '/landmarks' do
    @landmark = Landmark.create("name" => params[":landmark"]["name"], "year_completed" => params[":landmark"]["year_completed"])
    redirect '/landmarks'
  end
end
