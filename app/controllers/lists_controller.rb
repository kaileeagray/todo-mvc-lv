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
    @item = @list.items.build
  end

  def create
    @list = List.new(list_params)
    # redirects should use a full url
    if @list.save
      redirect_to list_url(@list)
    else
      @lists = List.all
      # if there is an error, @list will now hold the list that was not successfully created
      # since we used render, we did not create a request
      # so @list is still avail with errors
      
      render :index
    end
  end

  private

    def list_params # strong params
      params.require(:list).permit(:name)
    end


end
