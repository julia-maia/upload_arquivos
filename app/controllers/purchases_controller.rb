class PurchasesController < ApplicationController
  def index
    @purchases = Purchase.includes(:purchaser, item: :merchant)
  end

  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy
    redirect_to purchases_path, notice: "Compra excluída com sucesso."
  end

  def show
    @purchase = Purchase.find(params[:id])
  end

  def edit
    @purchase = Purchase.find(params[:id])
  end

  def update
    @purchase = Purchase.find(params[:id])
    if @purchase.update(purchase_params)
      redirect_to purchases_path, notice: "Compra atualizada com sucesso."
    else
      render :edit
    end
  end
end

private

def purchase_params
  params.require(:purchase).permit(:purchaser_id, :item_id, :count)
end
