
get '/' do
	#let user create new short URL, display a list of shortened URLs
	@urls = Url.all
  erb :"static/index"



end

post '/urls' do

	#create a new Url
	@new_url = Url.new(long_url: params[:url][:long])
	# new_url = Url.new(long_url: params[:long_url])
	if @new_url.save

		redirect '/'
	else
		@error_message = @new_url.errors.messages
		@urls = Url.all
		erb :"static/index"
	end
	# puts "[LOG] Getting/urls"
 #  puts "[LOG] Params: #{params.inspect}"
end

get '/:short_url' do
	# params[:short_url]
	#redirect to appropriate "long" URL
	url = Url.find_by(short_url: "http://localhost:9393/#{params[:short_url]}")
	url.click
	url.save
	redirect url.long_url
end
