class PurchasersController < ApplicationController
  before_action :set_purchaser, only: %i[ show edit update destroy ]

  def index
    @purchasers = current_user.purchasers
  end

  def show
  end

  def new
    @purchaser = Purchaser.new
  end

  def edit
  end

  def create
    @purchaser = current_user.purchasers.build(purchaser_params)

    respond_to do |format|
      if @purchaser.save
        format.html { redirect_to @purchaser, notice: "Purchaser was successfully created." }
        format.json { render :show, status: :created, location: @purchaser }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @purchaser.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @purchaser.update(purchaser_params)
        format.html { redirect_to @purchaser, notice: "Purchaser was successfully updated." }
        format.json { render :show, status: :ok, location: @purchaser }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purchaser.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @purchaser.destroy!

    respond_to do |format|
      format.html { redirect_to purchasers_path, status: :see_other, notice: "Purchaser was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_purchaser
      @purchaser = Purchaser.find(params.expect(:id))
    end

    def purchaser_params
      params.expect(purchaser: [ :name ])
    end
end
