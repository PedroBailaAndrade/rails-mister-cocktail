class DosesController < ApplicationController
  before_action :fetch_cocktail, only: [:new, :create]

  def new
    @dose = Dose.new
    @dose.cocktail = @cocktail
  end

  def create
    @dose = Dose.new(doses_params)
    @dose.cocktail_id = @cocktail.id
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def doses_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end

  def fetch_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
