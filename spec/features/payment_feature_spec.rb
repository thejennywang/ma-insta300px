require 'rails_helper'

describe 'Payments' do
  before do
    jenny = create(:jenny)
    login_as jenny
    create(:post, price: 7.00)
  end

  it 'should take users to a payment page after clicking on the buy button', js: true do
    visit posts_path

    click_link '$7.00'
    expect(page).to have_content 'Pay with Card'
  end

  it 'should take users to a payment success page after clicking on the Pay with Card button', js: true do
    visit posts_path

    click_link '$7.00'
    find('.stripe-button-el').click

    Capybara.within_frame 'stripe_checkout_app' do
    fill_in 'Email', :with => 'jenny@example.com'
    fill_in "Card number", :with => "4242 4242 4242 4242"
    fill_in 'MM / YY', :with => '11/17'
    fill_in 'CVC', :with => '123'
    click_button 'Pay $7.00'
    end

    sleep 6

    expect(page).to have_content 'Thanks, you paid $7.00!'
  end
end