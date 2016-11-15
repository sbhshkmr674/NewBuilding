class FloorsController < ApplicationController
	before_action :set_house

   def index
     @floors=house.floors.all
   end

   def new
       @house=House.find(:house_id)
       @floor=Floor.new
   end
	def create
		@house = House.find(params[:house_id])
		 @floor=@house.floors.build(floor1_params)
		
		if @floor.save
		 	flash[:success]= "Your floor is created"
		 	redirect_to [@house, @floor]
		 else
		 	flash[:alert]="Something happning wrong"
		 	render root_path
	     end
	end

	def show 
		#@floor=@building.floors.find(params[:building_id])
	    @floor=Floor.find(params[:id])
	    @room=Room.new
	end
 	def update  
       @floor = Floor.find(params[:house_id])
       @floor.update(floor1_params)
       redirect_to(floor_path(@floor))
    end 
    def destroy  
  @floor = @house.floors.find(params[:id])

  @house.destroy
  flash[:success] = "House deleted :("
  redirect_to root_path
end   

	private 
	 def floor1_params
	  params.require(:floor).permit(:name ,:image)
	end

	def set_house  
      @house = House.find(params[:house_id])
    end  
end