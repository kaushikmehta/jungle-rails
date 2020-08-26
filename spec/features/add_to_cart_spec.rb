require 'rails_helper'

RSpec.feature "Visitor navigates to product details", type: :feature, js: true do
   # SETUP
   before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They are able to add product to cart" do
    # ACT
    visit root_path

    first(:button, 'Add').click

    # DEBUG / VERIFY
    save_screenshot
    expect(page).to have_content("My Cart (1)")

  end

  scenario "They are able to add two products to cart" do
    # ACT
    visit root_path

    first(:button, 'Add').click
    all(:button, 'Add')[2].click

    # DEBUG / VERIFY
    save_screenshot
    expect(page).to have_content("My Cart (2)")

  end

end