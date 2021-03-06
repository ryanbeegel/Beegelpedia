class WikisController < ApplicationController
  def index
      @wikis = Wiki.visible_to(current_user)
      authorize @wikis
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def create
    @wiki = current_user.wikis.build(wiki_params)
    authorize @wiki
    if @wiki.save
      flash[:notice] = "Wiki was saved!"
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving your Wiki. Please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def update
     @wiki = Wiki.find(params[:id])
     authorize @wiki
     if @wiki.update_attributes(wiki_params)
       flash[:notice] = "Wiki was updated!"
       redirect_to @wiki
     else
       flash[:error] = "There was an error saving the Wiki. Please try again."
       render :edit
     end
   end

   def destroy
     @wiki = Wiki.find(params[:id])
 
     authorize @wiki
     if @wiki.destroy
       flash[:notice] = "Wiki was deleted successfully."
       redirect_to wikis_path
     else
       flash[:error] = "There was an error deleting the wiki."
       render :show
     end
   end

  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :image, :private)
  end
end