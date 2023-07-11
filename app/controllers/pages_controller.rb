class PagesController < ApplicationController

  def index
    @parts = Part.all
    @parts = @parts.where(system: params[:system]) if params[:system]
    @parts = @parts.where(category: params[:category]) if params[:category]
    @parts = @parts.where(description: params[:description]) if params[:description]
   
  end

end