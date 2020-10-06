#./app.rb is our main application file, defining 
#the controller that will power this web application.
class Application < Sinatra::Base
  #turns the app into a Sinatra controller.
  get '/' do
    #route to /
    erb :index
  end

  #the Sinatra post method creates a response 
  #for requests to POST '/greet'
  post '/greet' do
    erb :greet
  end
end