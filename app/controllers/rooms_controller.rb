class RoomsController < ApplicationController
 before_action :set_floor
    def index
    	@floor=Floor.find(params[:floor_id])
    	@rooms=@floor.rooms
    end

    def new 
    	@house=House.find(params[:house_id])
    	@floor=Floor.find(params[:floor_id])
    	@room=Room.new
    end
	def create
		@house=House.find(params[:house_id])
		
		@floor=Floor.find(params[:floor_id])
		@room=@floor.rooms.build(room_params)

		if @room.save
			flash[:success]="U created room"
			redirect_to [@house, @floor, @room]
		else
			flash[:alert]="Sorry Something happening wrong"
			render 'new'
		end
	end

	def show
		#@room=@floor.rooms.find(params[:floor_id])
	    @room=Room.find(params[:id])
	end

	private
	def room_params
		params.require(:room).permit( :room_number, :image)
	end
    def set_floor
		@house=House.find(params[:house_id])
		@floor=Floor.find(params[:floor_id])
	end
	
end
