require 'sinatra'

## Associates Root of the website with following code block when a get request is processed
get '/' do
    "Hello World"
end

## Parmeters are available via hash named params
post '/secret' do
 "Message is #{params[:message]} "
end

## Named parameters again accessible via params and thanks /? it works with and without trailing slash
get '/send/:room/?' do
 "Sending message to room no #{params[:room]}"
end

get '/mix/*/with/*/?' do
"I have #{params[:splat]} and I am going to mix #{params[:splat].first} with #{params[:splat].last} "
end
