class Api::V1::WebUrlController < ApplicationController
	skip_before_action :verify_authenticity_token

	def index
		@array = []
		response_hash = {}
		WebUrl.all.each_with_index{|w,index| response_hash["url_#{index}"] = [ w.url, {"link_contents" => w.link_contents.map{|link| link.url}}, {"h1_contents" => w.h1_contents.map{|h1| h1.title.gsub( /\s+/, " " )}}, {"h2_contents" => w.h2_contents.map{|h2| h2.title.gsub( /\s+/, " " )}}, {"h3_contents" => w.h3_contents.map{|h3| h3.title.gsub( /\s+/, " " )}}  ]}
		@array.push(response_hash) 
		render :json =>@array
	end

	def create
		response = []
		response_hash = {}
		web_url = WebUrl.create_contents(params[:web_url][:url])
		if web_url.present? && !web_url.eql?("Error")
			response_hash["url"] = [ web_url.url, {"link_contents" => web_url.link_contents.map{|link| link.url}}, {"h1_contents" => web_url.h1_contents.map{|h1| h1.title.gsub( /\s+/, " ")}}, {"h2_contents" => web_url.h2_contents.map{|h2| h2.title.gsub( /\s+/, " ")}}, {"link_contents" => web_url.h3_contents.map{|h3| h3.title.gsub( /\s+/, " ")}}  ]
			response.push(response_hash)
		else
			response = "Something is wrong.."
		end  
  	render :json =>response
  end
end
