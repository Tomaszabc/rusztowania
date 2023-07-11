class PagesController < ApplicationController

  def index
    @parts = Part.all
    @parts = @parts.where(system: params[:system]) if params[:system]
    @parts = @parts.where(category: params[:category]) if params[:category]
    @part = Part.find_by(description: params[:description], category: params[:category], system: params[:system]) if params[:description]
   
  end

end