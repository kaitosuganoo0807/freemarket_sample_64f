class SignupController < ApplicationController

  prepend_before_action :check_captcha, only: [:create]
  prepend_before_action :customize_sign_up_params, only: [:create]
  
  def index
    delete_session
    redirect_to root_path if user_signed_in?
  end

  def registration
    @user = User.new
  end

  def registration_validates
    
    @user = set_user_when_email(user_params)
    

    @user.valid?
  
    skip_phone_validate(@user.errors) 
    
    if @user.errors.messages.blank? && @user.errors.details.blank?
      create_session(user_params)
      redirect_to authentication_signup_index_path
    else
      render :registration
    end
  end


  def authentication
    
    @user = User.new
    
  end

  def authentication_create
    
    set_user_with_session

    @user[:phone] = user_params[:phone]
    if @user.save
      
      sign_in User.find(@user.id) unless user_signed_in?
      delete_session
      redirect_to address_signup_index_path
    else
      
      render :authentication
    end
  end

  def address
    @address = Address.new
  end

  def address_add
    @address = set_address(address_params)
    
    @address.valid?
    
    if @address.errors.messages.blank? && @address.errors.details.blank?
      create_session_address(address_params)
      
    else
      render :address
    end

    if @address.save
      redirect_to completed_signup_index_path
    else
      render :address_add
    end

  end

  def credit
  end


  def completed
  end






  private

    def user_params
      params.permit(
        :nickname,
        :email,
        :password,
        :password_confirmation,
        :surname,
        :first_name,
        :surname_kana,
        :first_name_kana,
        :birthday, 
        :phone)
    end

    def set_user_when_email(user_params)
      user_params[:birthday] = birthday_join
      User.new(
        nickname: user_params[:nickname],
        email: user_params[:email],
        password: user_params[:password_confirmation],
        password_confirmation: user_params[:password_confirmation],
        surname: user_params[:surname],
        first_name: user_params[:first_name],
        surname_kana: user_params[:surname_kana],
        first_name_kana: user_params[:first_name_kana],
        birthday: user_params[:birthday]
      )
    end

    def set_user_with_session
      @user = User.new(
        nickname: session[:nickname],
        email: session[:email],
        password: session[:password_confirmation],
        password_confirmation: session[:password_confirmation],
        surname: session[:surname],
        first_name: session[:first_name],
        surname_kana: session[:surname_kana],
        first_name_kana: session[:first_name_kana],
        birthday: session[:birthday]
      )
    end

    def skip_phone_validate(errors)
      errors.messages.delete(:phone)
      errors.details.delete(:phone)
    end

    def create_session(user_params)
      user_params[:birthday] = birthday_join
      session[:nickname] = user_params[:nickname]
      session[:email] = user_params[:email]
      session[:password] = user_params[:password_confirmation]
      session[:password_confirmation] = user_params[:password_confirmation]
      session[:surname] = user_params[:surname]
      session[:first_name] = user_params[:first_name]
      session[:surname_kana] = user_params[:surname_kana]
      session[:first_name_kana] = user_params[:first_name_kana]
      session[:birthday] = user_params[:birthday]
    end

    def delete_session
      session.delete(:nickname)
      session.delete(:email)
      session.delete(:password)
      session.delete(:password_confirmation)
      session.delete(:surname)
      session.delete(:first_name)
      session.delete(:surname_kana)
      session.delete(:first_name_kana)
      session.delete(:birthday)
      session.delete(:pid)
      session.delete(:provider)
    end

    def birthday_join
      year = params["birthday(1i)"]
      month = params["birthday(2i)"]
      day = params["birthday(3i)"]
      birthday = year.to_s + "-" + month.to_s + "-" + day.to_s
      return birthday
    end

    def address_params
      params.permit(
        :surname,
        :first_name,
        :surname_kana,
        :first_name_kana,
        :post_code,
        :prefecture,
        :city,
        :street,
        :building,
        :phone,
        :user_id
      ).merge(user_id: current_user.id)
    end

    def set_address(address_params)
      Address.new(
        user_id: address_params[:user_id],
        post_code: address_params[:post_code],
        prefecture: address_params[:prefecture],
        city: address_params[:city],
        surname: address_params[:surname],
        first_name: address_params[:first_name],
        surname_kana: address_params[:surname_kana],
        first_name_kana: address_params[:first_name_kana],
        phone: address_params[:phone],
        street: address_params[:street],
        building: address_params[:building]
      )
    end

    def create_session_address(address_params)
        session[:user_id] = address_params[:user_id],
        session[:post_code] = address_params[:post_code],
        session[:prefecture] = address_params[:prefecture],
        session[:city] = address_params[:city],
        session[:surname] = address_params[:surname],
        session[:first_name] = address_params[:first_name],
        session[:surname_kana] = address_params[:surname_kana],
        session[:first_name_kana] = address_params[:first_name_kana],
        session[:phone] = address_params[:phone],
        session[:street] = address_params[:street],
        session[:building] = address_params[:building]
    end

    def customize_sign_up_params
      devise_parameter_sanitizer.permit :sign_up, keys: [:username, :email, :password, :password_confirmation, :remember_me]
    end
  
    def check_captcha
      self.resource = resource_class.new sign_up_params
      resource.validate
      unless verify_recaptcha(model: resource)
        respond_with_navigational(resource) { render :new }
      end
    end

end
