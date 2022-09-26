require 'rails_helper'
RSpec.describe Product, type: :model do

  describe 'Product Validations' do
    it 'all 4 fields will save successfully' do
      @product = Product.new(name: 'prickly', category: @category, quantity: 2, price_cents: 40)
      @product.save
      expect(@product).to be_present
    end

  end


end