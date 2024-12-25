class RoomsController < ApplicationController
  before_action :load_room, only: [ :edit, :update ]

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  # Save the new room to the database
  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to @room, notice: "Room created successfully."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @room.update(room_params)
      redirect_to @room, notice: "Room updated successfully."
    else
      render :edit
    end
  end

  private

  def load_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name, :user_id, :description)
  end
end
