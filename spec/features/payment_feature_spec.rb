require 'rails_helper'

describe 'Payments' do
  before do
    jenny = create(:jenny)
    login_as jenny
    create(:post, price: 5.00)
  end

  it 'should taken users to a payment page after clicking on the buy button', js: true do
    visit posts_path

    click_link '$5.00'
    expect(page).to have_content 'Pay with Card'
  end
end