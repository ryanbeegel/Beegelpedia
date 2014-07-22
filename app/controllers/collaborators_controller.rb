class CollaboratorsController < ApplicationController
  before_action :set_wiki

  def index
    @users = User.all
  end

  def destroy
    @collaborator = @wiki.collaborators.find(params[:id])
    if @collaborator.destroy
      flash[:notice] = "Your collaborator was removed"
    else
      flash[:error] = "Collaborator couldn't be removed. Please try again."
    end

    redirect_to wiki_collaborators_path(@wiki)
  end

  def create
    @wiki.collaborators.build(user_id: params[:user_id])
    if @wiki.save
      flash[:notice] = "Your collaborator was added"
    else
      flash[:error] = "your collaborator was not added"
    end

    redirect_to wiki_collaborators_path(@wiki)
  end

  private 

  def set_wiki
    @wiki = Wiki.find(params[:wiki_id])
  end
end
