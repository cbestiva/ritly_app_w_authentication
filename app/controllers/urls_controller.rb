class UrlsController < ApplicationController

	before_filter :signed_in_user, only: [:create, :new, :edit, :update]

	def index
		# set an instance url as a new model
		@url = Url.new
	end

	def create
		# raise params.inspect
		safe_url = params.require(:url).permit(:link)
		@url = Url.create(safe_url)
		@url.random_string = SecureRandom.urlsafe_base64(7)
		@url.save
		# binding.pry
		redirect_to @url
	end

	def show
		id = params[:id]
		@url = Url.find(id)
	end

	def go_to_link
		code = params[:random_string]
		url = Url.find_by_random_string(code)
		if url.link.include?("https://")
			redirect_to url.link
		else
		redirect_to "https://#{url.link}"
		end
		url.count
	end

	def display_links
		#get all urls
		@url = Url.all
	end

	def preview
		code = params[:random_string]
		@url = Url.find_by_random_string(code)
	end	

	def destroy
		id = params[:id]
		url = Url.find(id).destroy
		
		redirect_to all_urls_path
	end

end