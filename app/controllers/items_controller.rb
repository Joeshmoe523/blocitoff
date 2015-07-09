class ItemsController < ApplicationController

  def index
    @user = current_user
    @item = Item.where(user_id: @user.id)
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:user_id, :due_date, :description, :status)
    end
end
