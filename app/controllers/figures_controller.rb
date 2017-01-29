class FiguresController < ApplicationController
  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/edit'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  post '/figures/:id' do
    #binding.pry
    @figure = Figure.find(params[:id])
    @figure.update(params[":figure"])

    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    if !params["title"]["name"].empty?
      @figure.titles << Title.create(params[:title])
    end

    @figure.save
    erb :'/figures/show'
  end

  post '/figures' do
    @figure = Figure.create("name" => params["figure"]["name"])
    @title = Title.find_or_create_by("name" => params["title"]["name"])
    @landmark = Landmark.find_or_create_by("name" => params["landmark"]["name"], "year_completed" => params["landmark"]["year_completed"])
    @figure.title_ids = params["figure"]["title_ids"]
    @figure.titles << @title
    @figure.landmark_ids = params["figure"]["landmark_ids"]
    @figure.landmarks << @landmark
    @figure.save
    redirect '/figures'
  end


end
