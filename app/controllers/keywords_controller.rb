class KeywordsController < ApplicationController
  def index
    @keywords = Keyword.all
  end
  
  def show
    @keyword = Keyword.find(params[:id])
  end
  
  def new
    @keyword = Keyword.new
  end
  
  def create
    @keyword = Keyword.new(params[:keyword])
    if @keyword.save
      flash[:notice] = "Successfully created keyword."
      redirect_to keywords_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @keyword = Keyword.find(params[:id])
  end
  
  def update
    @keyword = Keyword.find(params[:id])
    if @keyword.update_attributes(params[:keyword])
      flash[:notice] = "Successfully updated keyword."
      redirect_to @keyword
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @keyword = Keyword.find(params[:id])
    @keyword.destroy
    flash[:notice] = "Successfully destroyed keyword."
    redirect_to keywords_url
  end
end
