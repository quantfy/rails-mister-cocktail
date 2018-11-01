class DosesController < ApplicationController
  before_action :set_cocktail

    def new
      @dose = Dose.new
    end

    def create
      @dose = @restaurant.doses.build(dose_params)
      if @review.save
        redirect_to cocktail_path(@cocktail)
      else
        render :new
      end
    end

    private

    def set_cocktail
      @cocktail = Cocktail.find(params[:cocktail_id])
    end

    def review_params
      params.require(:dose).permit(:description, :id_cocktail, :id_ingredient)
    end
