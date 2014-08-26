class ChargesController < ApplicationController

  def index
  end

  def new
  end

  def show
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => (@post.price * 100).floor, #Amount in cents
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
  end
end
