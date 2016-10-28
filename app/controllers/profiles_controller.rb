class ProfilesController < ApplicationController

  def new
    # new user profile
    @user = User.find( params[:user_id] ) # find logged in user
    @profile = @user.build_profile
    # Build Profile is a special function that we can use because of db associations and routes:
  end

  def create
  end

  def edit
  end

end
