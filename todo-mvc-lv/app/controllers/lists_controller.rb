class ListsController < ApplicationController

  def index
    @list = List.new
    @lists = List.all
    # render 'list/index.html.erb'
    # raise @lists.inspect #was the controller able to get the lists
  end

  def show
    # params has all the data passed by a user
    # lists/:id - reading from URL
    @list = List.find(params[:id])
  end

  def create
    raise params.inspect
  end


end
