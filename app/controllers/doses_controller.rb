class DosesController < ApplicationController

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @dose = Dose.new(strong_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  def destroy
  
    @dose = Dose.find(params[:id])
    if @dose.destroy
      redirect_to cocktail_path( @dose.cocktail)
    else
      flash[:error] = 'Something went wrong'
      redirect_to objects_url
    end
  end
  
  
  private

  def strong_params
    params.require(:dose).permit(:ingredient_id, :description)
    
  end
  

end
