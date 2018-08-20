class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    recipe = Recipe.new(name: params[:user], ingredients: params[:ingredients], cook_time: params[:cook_time])
    recipe.save
    redirect to '/recipes/'
  end

  get '/recipes/:id' do
    erb :show
  end

end
