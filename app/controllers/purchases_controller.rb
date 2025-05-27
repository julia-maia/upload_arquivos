class PurchasesController < ApplicationController
  def index
    @per_page = 10  # Itens por página
    @current_page = (params[:page] || 1).to_i  # Página atual

    filtered = Purchase.filtered_by_purchaser(params[:purchaser_name])

@purchases = filtered
               .includes(:purchaser, item: :merchant)
               .order(created_at: :desc)
               .offset((@current_page - 1) * @per_page)
               .limit(@per_page)

total_purchases = filtered.count
    @total_pages = (total_purchases.to_f / @per_page).ceil
  end

  def new
    @purchase = Purchase.new
  end

  def create
    
    @purchase = Purchase.new(purchase_params)
    if @purchase.save
      redirect_to @purchase, notice: "Compra criada com sucesso."
    else
      render :new
    end
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
