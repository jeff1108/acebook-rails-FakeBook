class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
    @user = User.find(session[:current_user_id])
  end

  def create
     @user = User.find(session[:current_user_id])
     @profile = Profile.create(profile_params)
      @profile.save
       redirect_to user_path(@user)
     # else
     #   flash[:alert] = "Could not upload profile"
     #   render :new

   end

   private

   def profile_params
     # params.require(:profile).permit(:summary, :image, :user_id)
      { summary: params[:summary], image: params[:image], user_id: params[:user_id] }
   end

end
