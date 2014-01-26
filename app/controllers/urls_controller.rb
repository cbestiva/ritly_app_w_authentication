class UrlsController < ApplicationController

	def index
		@url = Url.new
	end

	def create
		safe_url = params.require(:url).permit(:link)
		@url = Url.create(safe_url)
		@url.random_string = SecureRandom.urlsafe_base64(7)
		@url.save
		redirect_to @url
	end

	def show
		id = params[:id]
		@url = Url.find(id)
	end

	def go_to_link
		code = params[:random_string]
		url = Url.find_by_random_string(code)
		url.count
		if url.link.include?("https://")
			redirect_to url.link
		else
		redirect_to "https://#{url.link}"
		end
	end

	def display_links
		#get all urls
		@url = Url.all
	end

end