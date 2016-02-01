class WineriesController < ApplicationController

	def new
	end

	def create
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
	
	def winery_params
		params.require(:winery).permit(:name, :wine_club)		
	end
end
