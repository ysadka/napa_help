class StaticController < ApplicationController

	def homepage
		@wineries = Winery.all
		@varietals = Varietal.all
	end

	def scuba_steve
	end
end