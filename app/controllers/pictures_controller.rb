class PicturesController < ApplicationController

	def index
		@pictures = Picture.all
	end

	def show
		@picture = Picture.find(params[:id])
	end

	def new
		@picture = Picture.new
	end

	def create
	  # Make the variable @picture a new picture with the given params
	  @picture = Picture.new(picture_params)
	  if @picture.save
	    # if the save for the picture was successful, go to index.html.erb
	    redirect_to pictures_url
	  else
	    # otherwise render the view associated with the action :new (i.e. new.html.erb)
	    render :new
	  end
	end

	def edit
	  @picture = Picture.find(params[:id])
	end

	def update
	  @picture = Picture.find(params[:id])

	  if @picture.update_attributes(picture_params)
	    redirect_to "/pictures/#{@picture.id}"
	  else
	    render :edit
	  end
	end

	def destroy
	  @picture = Picture.find(params[:id])
	  @picture.destroy
	  redirect_to pictures_url
	end

	private

	def picture_params
    params.require(:picture).permit(:title, :artist, :url)
  end
end