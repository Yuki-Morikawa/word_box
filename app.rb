require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'open-uri'
require 'sinatra/json'
require './models/contribution.rb'

get '/' do
  @contents = Contribution.order('id desc').all
  erb :index
end

post '/new' do
  Contribution.create({
    title: params[:title],
    linkTitle: params[:linkTitle],
    body: params[:body],
    url: params[:url]
  })

  redirect '/'
end

post '/delete/:id' do
  Contribution.find(params[:id]).destroy
  redirect '/'
end

post '/edit/:id' do
  @contents = Contribution.find(params[:id])
  erb :edit
end

post '/renew/:id' do
  @contents = Contribution.find(params[:id])
  content.update({
    title: params[:title],
    linkTitle: params[:linkTitle],
    body: params[:body],
    url: params[:url]
    
  redirect '/'
end