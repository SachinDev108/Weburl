class WebUrl < ApplicationRecord
	has_many :h1_contents, :dependent => :delete_all
	has_many :h2_contents, :dependent => :delete_all
	has_many :h3_contents, :dependent => :delete_all
	has_many :link_contents, :dependent => :delete_all
	#validates :url, presence: true

	require 'rubygems'
	require 'nokogiri'
	require 'open-uri'

	def self.create_contents(url)
		@web_url = self.find_or_create_by(url: url)
		begin
      doc = Nokogiri::HTML(open(url))
      @tags = doc.search('*').map(&:name)
      if @tags.any? { |x| ["h1", "h2", "h3", "link"].include?(x) }
      	
      	if doc.search('h1').present?
	        doc.search('h1').xpath('text()').each do |h1_tag|
	        	@web_url.h1_contents.find_or_create_by(title: h1_tag.text) if h1_tag.text.present?
	        end
	      end
	      if doc.search('h2').present?
	        doc.search('h2').xpath('text()').each do |h2_tag|
	        	@web_url.h2_contents.find_or_create_by(title: h2_tag.text) if h2_tag.text.present?
	        end
	      end

	      if doc.search('h3').present?
	        doc.search('h3').xpath('text()').each do |h3_tag|
	        	@web_url.h3_contents.find_or_create_by(title: h3_tag.text) if h3_tag.text.present?
	        end
	      end
	      
        @links_data = doc.search('link')
        if @links_data.present?
        	@links = []
	        @links_data.each do |link|
	        	@links << link.attributes["href"].value if link.attributes.present? && link.attributes["href"].present?
	        end
	        @links.each do |link|
	        	@web_url.link_contents.find_or_create_by(url: link)
	        end
	      end
      else
      	@web_url= "Require parameter not found"
      end
    rescue => error
    	@web_url = "Error"
    end
    return @web_url
  end
end
