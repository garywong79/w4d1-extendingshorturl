
get '/' do
	#let user create new short URL, display a list of shortened URLs
	@urls = Url.all
  erb :"static/index"



end

post '/urls' do

	#create a new Url
	new_url = Url.new(long_url: params[:url][:long])
	# new_url = Url.new(long_url: params[:long_url])
	new_url.save

	# puts "[LOG] Getting/urls"
 #  puts "[LOG] Params: #{params.inspect}"

	# erb :long_url
	redirect '/'
end

get '/:short_url' do
	# params[:short_url]
	#redirect to appropriate "long" URL
	url = Url.find_by(short_url: "http://localhost:9393/#{params[:short_url]}")
	redirect url.long_url
end
