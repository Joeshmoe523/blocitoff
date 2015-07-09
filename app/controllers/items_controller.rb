class ItemsController < ApplicationController

  def index
    @user = current_user
    @items = Item.where(user_id: @user.id)
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

  def edit
  end

  def update
  end

  def destroy
    @item = Item.find(params[:id])
    @item.status = "archived"
    @item.save

    render js: "$('##{@item.id}').slideUp()"
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:user_id, :due_date, :description, :status)
    end
end
