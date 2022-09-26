require 'rails_helper'
RSpec.describe Product, type: :model do

  describe 'Product Validations' do
    it 'all 4 fields will save successfully' do
      @product = Product.new(name: 'prickly', category: @category, quantity: 2, price_cents: 40)
      @product.save
      expect(@product).to be_present
    end
    it 'should not validate without name' do
      @product = Product.new(name: nil, category: @category, quantity: 2, price_cents: 40)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it 'should not validate without price_cents' do
      @product = Product.new(name: 'prickly', category: @category, quantity: 2, price_cents: nil)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    end


end