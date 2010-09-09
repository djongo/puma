class PublicationsController < ApplicationController
  #filter_resource_access
  filter_access_to :all
  
  auto_complete_for :variable, :name
 
  def index
   # @publications = Publication.search params[:search], :match_mode => :any
#   @publications = Publication.all
    if(params[:search]).blank?
      @publications = Publication.all.paginate(:page => params[:page], :per_page => 5, :order => 'title')
    else
      @publications = Publication.with_query(params[:search]).paginate( :page => params[:page], :per_page => 5, :order => 'title')
    end
  end
  
  def show
    @publication = Publication.find(params[:id])
  end
  
  def new
    @publication = Publication.new
    #@publication.determinants.build
  end
  
  def create
    @publication = Publication.new(params[:publication])
    #@publication.user = current_user
    if @publication.save
      flash[:notice] = "Successfully created publication."
      redirect_to @publication
    else
      render :action => 'new'
    end
  end
  
  def edit
    @publication = Publication.find(params[:id])
  end
  
  def update
    @publication = Publication.find(params[:id])
    if @publication.update_attributes(params[:publication])
      flash[:notice] = "Successfully updated publication."
      redirect_to @publication
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @publication = Publication.find(params[:id])
    @publication.destroy
    flash[:notice] = "Successfully destroyed publication."
    redirect_to publications_url
  end
  
#  def submit_for_planned
#    flash[:notice] = "Submit Planned"
#  end
#  def submit_for_in_progress
#    flash[:notice] = "Submit In Progress"
#  end
#  def submit_for_submitted
#    flash[:notice] = "Submit Submitted"
#  end
#  def submit_for_accepted
#    flash[:notice] = "Submit Accepted"
#  end
#  def submit_for_published
#    flash[:notice] = "Submit Published"
#  end
end
