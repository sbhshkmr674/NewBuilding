class HousesController < ApplicationController
   def index
		@houses=House.all
	end

	def new
		@house=House.new
	end
	 
	def create
	 	@house=House.create(house_params)

	 	if @house.save
	 		flash[:success]="You have successfully created the Building"
	        redirect_to houses_path	
	 	else
	 		flash[:alert]="Something happing wrong !!"
	 		render 'new'
	 	end
	end

	def show
		@house=House.find(params[:id])
	end

	def destroy
		@house=House.find(params[:id])

		if @house.destroy
			flash[:success]= "Building successfully destroyed"
		else
			flash[:alert]='Something happing wrong'
		end
	end

	def update
    @house = House.find(params[:id])
  @house.update(house_params)
  redirect_to(house_path(@house))
  end
  private

	def house_params
		params.require(:house).permit(:name, :image)
	end
end