class SearchMovie

	def initialize(request)
		Tmdb::Api.key(Rails.application.credentials.dig(:movie_api_key))
		@request= request
	end

	def search(request)
		array = []

		@search = Tmdb::Search.new
		@search.resource('movie') # determines type of resource
		@search.query(request) # the query to search against
		results = @search.fetch # makes request
		results.each do |movie|
			hash = Hash.new
			hash['title'] = movie['title']
      hash['release'] = movie['release_date']
      #hash['director'] = director(movie['id'].to_i)
			array << hash
		end
		return array

	end

	def perform
		search(@request)
	end

end
