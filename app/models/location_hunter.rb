module LocationHunter

	def parse_tweet(tweet)
		my_match = /(@|at|on)\s+((?:\S+\s)?\S*(and|&)\S*(?:\s\S+)?)|\S\d+\s\b\w+\b\s(Avenue|Ave|Street|St)|\A?^?\d+\s(\b\w+\b\s)+(Avenue|Ave|Street|St)|(\b\w+\b\s){2}Park|(\b\w+\b\s)(St|Street)\sand?\s(\b\w+\b\s)(St|Street)|(\b\w+\b\s)between(\s\b\w+\b)/i.match(tweet).to_s
	end

	def clean_match(match)
		match = /seaport/i.match(match).to_s if match == ""

		match.gsub!("#", "")
		match.gsub!("(", "")
		match.gsub!(")", "")
		match.gsub!(" at ", "")
		match.gsub!("at ", "")
		match.gsub!(" on ", "")
		match.gsub!("on ", "")
		match.gsub!("@", "")
		match.gsub!("between", "and")
		match.gsub!("btw", "and")

		return false if match == ""

		match
	end

	# def geocode_coordinates(location)
	# 	return false if location == false

	# 	geo_data = Geocoder.search(location + ", new york city").first
	# 	latitude = geo_data.geometry["location"]["lat"]
	# 	longitude = geo_data.geometry["location"]["lng"]

	# 	return false if [latitude, longitude] == [40.7127837, -74.0059413]
	# 	[latitude, longitude]
	# end

	def get_coordinates(tweet_body)
		match = parse_tweet(tweet_body)
		cleaned_match = clean_match(match)

		self.update_attributes(address: "#{cleaned_match}, New York City", location_last_updated: Time.now) if cleaned_match
	end

end
