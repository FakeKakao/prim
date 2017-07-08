#!/usr/bin/ruby

require 'sinatra'
require './lib/graph'

set :port, 80
set :public_folder, File.dirname(__FILE__)

get '/' do
	erb :prim_sim
end

post '/ini-graph' do
	$g = Graph.new(params[:nv].to_i)
	redirect '/'
end

post '/add-edge' do 
	$g.add_edge(params[:src].to_i, params[:dist].to_i, params[:weight].to_i)
	redirect '/'
end

post '/inc-node' do
	$g.inc_node(params[:inc].to_i)
	redirect '/'
end

post '/print-prim' do 
	ret = $g.prim 
	rediret '/'
end
