
class PagesController < ApplicationController 
    def index 
        @time = Time.zone.now
        @name = "Jeremy"
    end
    def get_star_wars
        response = Excon.get('http://star-wars-characters.glitch.me/api/characters')
        render json: JSON.parse(response.body)
    end
end