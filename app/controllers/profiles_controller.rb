class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :only_current_user

  def new
    # new user profile form
    @user = User.find(params[:user_id]) # find logged in user
    @profile = Profile.new
    # Build Profile is a special function that we can use through db associations and routes
  end

  def create
    # save submitted user profile
    @user = User.find(params[:user_id])
    @profile = @user.build_profile(profile_params)
    if @profile.save
      flash[:success] = "Profile Updated!"
      redirect_to user_path(params[:user_id])
      else
      render action: :new
      # redirect user to the new controller
    end
  end

  def show
  end

  def edit
    @user = User.find(params[:user_id])
    @profile = @user.profile
  end

  def update
    @user = User.find(params[:user_id])
    @profile = @user.profile
    if @profile.update_attributes(profile_params)
      redirect_to user_path(params[:user_id])
      flash[:success] = "Profile Updated!"
      else
      render action: :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
  end
end

def only_current_user
  @user = User.find(params[:user_id])
  redirect_to(root_url) unless @user == current_user
end
