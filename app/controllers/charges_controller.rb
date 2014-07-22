class ChargesController < ApplicationController
  def create

    @amount = params[:amount]

    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: "BigMoney Membership - #{current_user.email}",
      currency: 'usd'
    )

    current_user.update_attribute(:premium, true)

    flash[:success] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
    redirect_to user_path(current_user) # or wherever

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end

  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Beegelpedia Membership - #{current_user.name}",
      amount: 5_00
      # We're like the Snapchat for Wikipedia. But really, 
      # change this amount. Stripe won't charge $9 billion.
    }
  end
end