class ItemsController < ApplicationController

  def index
    @user = current_user

    case params[:filter]
    when "archived"
      @items = Item.where(user_id: @user.id).where(status: "Archived")
    else
      @items = Item.where(user_id: @user.id).where(status: "Pending")
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

  def edit
    @item = Item.find(params[:id])
  end

  def update
  end

  def destroy
    @item = Item.find(params[:id])
    @item.status = "Archived"
    @item.save

    render js: "$('##{@item.id}').slideUp()"
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:user_id, :due_date, :description, :status)
    end
end
