class UsersController < ApplicationController
   
  def edit
  end

  def update
    if current_user.update(params)
      redirect_to root_path
    else
      render :edit
    end
  end

  
  

  private

  def params
    params.require(:user).permit(:name, :email, :nickname)
  end
end


