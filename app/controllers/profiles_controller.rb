class ProfilesController < ApplicationController

  def new
    # new user profile form
    @user = User.find(params[:user_id]) # find logged in user
    @profile = @user.build_profile
    # Build Profile is a special function that we can use through db associations and routes:
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

  def edit
  end

  private
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
  end
end
