# require_relative '../../config/environments/init'
require_relative '../../config/environments/test'
# require_relative '../../config/database'
# require_relative '../../config/puma'

class Url < ActiveRecord::Base
	validates :long_url, format: { with: /(^http:|https:)/, message: "must enter http:// or https://"} 

	before_create :shorten

	def shorten
		url = [('a'..'z'), ('A'..'Z'),(1..9)].map { |i| i.to_a }.flatten
		string = (0...10).map { url[rand(url.length)] }.join
		self.short_url = "http://localhost:9393/#{string}"
	end
end
