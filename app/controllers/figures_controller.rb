class FiguresController < ApplicationController
  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    puts params
    erb :"/figures/#{@figure.slug}"
  end
end
