class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = current_user.items
  end

  def show
  end

  def new
    @item = Item.new
    @merchants = Merchant.all
  end

  def edit
    @item = Item.find(params[:id])
    @merchants = Merchant.all
  end

  def create
    @item = current_user.items.build(item_params)
    @merchants = Merchant.all

    if @item.save
      redirect_to @item, notice: 'Item criado com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy!
    redirect_to items_path, status: :see_other, notice: "Item foi excluído com sucesso."
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html {redirect_to @item, notice: "Item atualizado com sucesso!." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private

    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:description, :price, :merchant_id)
    end
end