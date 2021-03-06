class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:index, :show, :edit, :update]
  
  def new
    @user = User.new
  end

  def index
    @per_page = params[:per_page] || User.per_page || 15
    @users = User.paginate( :per_page => @per_page, :page => params[:page] )  
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Registration successful."
      redirect_to root_url
      #redirect_back_or_default account_url
    else
      render :action => 'new'
    end
  end

  def show
    @user = current_user
    if(@user.publication_group?)
      @user = User.find(params[:id])
    end
  end

  
  def edit
    @user = current_user 
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated profile."
      redirect_to root_url
      #redirect_to account_url
    else
      render :action => 'edit'
    end
  end
end
