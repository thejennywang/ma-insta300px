require 'rails_helper'

describe 'Payments' do
  before do
    jenny = create(:jenny)
    login_as jenny
    visit posts_path
    click_link  'New Post'
    fill_in 'Title', with: 'A post with a price'
    attach_file 'Picture', Rails.root.join('spec/images/time.jpg')
    fill_in 'Price', with: '7.00'
    click_button 'Post'

    sleep 2
  end

  it 'should take users to a payment page after clicking on the buy button', js: true do
    find('.uploaded-pic').click
    expect(page).to have_content 'Pay with Card'
  end

  it 'should take users to a payment success page after clicking on the Pay with Card button', js: true do

    find('.uploaded-pic').click
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