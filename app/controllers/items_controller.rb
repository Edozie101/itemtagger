class ItemsController < ApplicationController

    before_action :set_item, only: [:show,:edit,:update,:destroy]


    def new
        if current_user
            @item = Item.new(user_id: current_user.id)
        else
            @item = Item.new(user_id: User.first)
        end
    end


    def create
        @item = Item.new(new_params)
        @item.qrcode = Qrcode.create(url: item_url(@item))
        if @item.save!
          respond_to do |format|
             format.html{ redirect_to @item, notice: "You've just created a new item"}
          end
      else
          render 'new'
      end
    end

    def index
        @items = Item.all
    end

    def my_items
        @items = Item.where( id: current_user.id)


    end

    def show
    end

    def update
        if @item.update
            respond_to do |format|
                format.html{redirect_to @item, notice: "Update completed"}
            end
        end
    end

    def destroy
        if @item.destroy
            respond_to do |format|
                format.html{redirect_to items_url, notice: "Update completed"}
            end
        end
    end


  private
    def set_item
        @item = Item.find(params['id'])
    end

    def new_params
        params.require(:item).permit(:user_id, :id, :description, :name,:avatar)
    end
    def edit_params
        params.require(:item).permit(:user_id, :id, :description, :name,:avatar, :lost)
    end
end
