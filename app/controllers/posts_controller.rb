class discoverController < ApplicationController
	def index
		@discover = Discover.all
	end

	def new
		@discover = Discover.all
	end

	def create
		@Discover = Discover.create Discover_params
	end

	def edit
		@Discover = Discover.find params[:id]
	end

	def show
		@Discover = Discover.find params[:id]
	end

	def create
		@Discover = Discover.new(Discover_params)
			if @Discover.save
				flash[:notice] = "Discover has been successfully saved"
				redirect_to hDiscover_path
			else
				flash[:error] = "Discover was not saved"
			end
	end

	def update
		@Discover = Discover.find params[:id]
		@Discover.update(Discover_params)
			if @Discover.save
    	flash[:notice] = 'Discover data was successfully created.'
    	redirect_to Discover_path
    else
    	flash[:error] = "Discover data was NOT saved."
    	render :new
		end
	end

	def destroy
		@Discover = Discover.find params[:id]
		@Discover.destroy
		redirect_to user_path
	end

private
	def Discover_params
		params.require(:Discover).permit(
			:content
			)
	end
end