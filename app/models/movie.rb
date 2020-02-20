require 'net/http'
require 'json'

class Movie < ActiveRecord::Base 
    belongs_to :user

    def self.fetch(keyword)
        url = "https://api.themoviedb.org/4/search/movie?api_key=7dd629038911a7d3dcf84371891ee64e&query=#{keyword}&page=1&per_page=5" 
        uri = URI(url)
        response = Net::HTTP.get(uri)
        JSON.parse(response)
    end 

end 