class WineriesController < ApplicationController

	def new
		@winery = Winery.new
	end

	def create
		@winery = Winery.new(winery_params)
		if @winery.save
      	flash[:success] = "Winery Added"
      	redirect_to root_path
    	else
      	render 'new'
		end
	end

	def show
		@winery = Winery.find(params[:id])
	end

	def edit
		@winery = Winery.find(params[:id])
	end

	def update
		@winery = Winery.find(params[:id])
		if @winery.update_attributes(winery_params)
			redirect_to root_path
		else
			render 'edit'
		end
	end

	def destroy
		@winery = Winery.find(params[:id])
		@winery. destroy
    flash[:success] = "Winery deleted"
    redirect_to root_path
	end

	private

	def winery_params
		params.require(:winery).permit(:name, :address, :phone, :wine_club)
	end
end
