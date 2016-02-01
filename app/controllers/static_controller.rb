class StaticController < ApplicationController

	def homepage
		@wineries = Winery.all
	end
end