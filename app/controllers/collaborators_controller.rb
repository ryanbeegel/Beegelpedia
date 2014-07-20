class CollaboratorsController < ApplicationController
  before_action :set_wiki

  def index
  end

  def destroy
  end

  def create
    @wiki.collaborators.build()
  end

  private 

  def set_wiki
    @wiki = Wiki.find(params[:wiki_id])
  end
end
