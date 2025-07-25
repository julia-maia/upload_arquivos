class PurchasesController < ApplicationController
  before_action :set_collections, only: [:new, :create, :edit, :update]

  def index
    @per_page = 10
    @current_page = (params[:page] || 1).to_i

    filtered = Purchase.where(user_id: current_user.id)

    if params[:purchaser_name].present?
      filtered = filtered.joins(:purchaser).where("purchasers.name ILIKE ?", "%#{params[:purchaser_name]}%")
    end

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
    @purchase.user = current_user

    if @purchase.save
      redirect_to purchases_path, notice: "Compra criada com sucesso."
    else
      render :new, status: :unprocessable_entity
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
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:purchaser_id, :item_id, :count)
  end

  def set_collections
    @purchasers = current_user.purchasers
    @items = current_user.items
  end
end