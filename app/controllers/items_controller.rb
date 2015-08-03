class ItemsController < ApplicationController

  def index
    @user = current_user

    case params[:filter]
    when "archived"
      @items = Item.archived.where(user_id: @user.id)
      @item = Item.new
    else
      @items = Item.active.where(user_id: @user.id)
      @item = Item.new
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id 
    if @item.save
      redirect_to items_path
      # render :index, notice: "Task was saved to your list."
    else
      flash[:error] = "Error creating task. Please try again."
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(item_params)
      flash[:notice] = "Task was updated"
      redirect_to items_path
    else
      flash[:error] = "There was an error saving your task. Please try again."
      render :show
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.status = "Archived"
    @item.save

    render js: "$('##{@item.id}').slideUp()"
  end

  private

    def item_params
      params.require(:item).permit(:user_id, :due_date, :description, :status)
    end
end
