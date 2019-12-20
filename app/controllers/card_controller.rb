class CardController < ApplicationController

  require "payjp"

  def index
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @default_card_information = customer.cards.retrieve(@card.card_id)
  end

  def new
    card = Card.where(user_id: current_user.id)
    if card.exists?
      redirect_to action: "show"
    else
      redirect_to action: "credit"
    end
  end

  def create
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      if card_params['payjp-token'].blank?
        redirect_to action: "credit"
      else
      customer = Payjp::Customer.create(card: card_params['payjp-token'])
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card, token: params['payjp-token'])
        if @card.save
          redirect_to controller: '/signup', action: 'completed'
        else
          redirect_to({action: "credit"}, notice: 'カード情報を入れ直してください')
        end
    end
  end

  def pay
    item = Item.find(card_params[:item_id])
    redirect_to "/items/#{item.id}" if item.status !=0
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    amount: item.price,
    customer: card.customer_id,
    currency: 'jpy',
    )
    item[:status] = 1
    item.save
    redirect_to item_card_complete_path
  end

  def destroy
      card = Card.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to mypage_card_path
  end

  def show
    card_information
  end

  def confirmation
    @item = Item.find(params[:item_id])
    @address = Address.find_by(user_id: current_user.id)
    card_information
  end

  def complete
    @item = Item.find(params[:item_id])
    @address = Address.find_by(user_id: current_user.id)
    card_information
  end

  private

  def card_exist

    @card = Card.where(user_id: current_user.id).first
    redirect_to action: "credit" if @card.blank?
  end

  def card_params
    params.permit('payjp-token',:item_id)
  end

  def card_information
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @default_card_information = customer.cards.retrieve(@card.card_id)
  end

end
