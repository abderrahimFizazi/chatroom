class RoomsController < ApplicationController
  before_action :authenticate_user!
   
  def index
    @room =Room.new
    @rooms = Room.public_rooms
    @users = User.all_except(current_user)
    render 'index'
  end
  def show 
    @room = Room.new
    @rooms = Room.public_rooms
    @single_room = Room.find(params[:id])
    @message = @single_room.messages.build
    @messages = @single_room.messages.order(created_at: :asc)

    @users = User.all_except(current_user)
    render 'index'
  end
  def create
    @room = Room.create(name: params["room"]["name"])
  end
end
