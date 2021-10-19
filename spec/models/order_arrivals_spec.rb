require 'rails_helper'

RSpec.describe OrderArrivals, type: :model do
  before do
    @order_arrivals = FactoryBot.build(:order_arrivals)
  end

describe '購入内容確認' do
  context '商品購入がうまくいく時' do
    it '全ての値が正しく入力されていれば購入できること' do
      @order_arrivals.valid?
      expect(@order_arrivals).to be_valid
    end
  end
  context '商品購入がうまくいかない時' do
    it 'post_codeが空だと購入できない' do
      @order_arrivals.post_code = ''
      @order_arrivals.valid?
      expect(@order_arrivals.errors.full_messages).to include("Post code can't be blank")
    end
    it 'post_codeにハイフンがないと購入できない' do
      @order_arrivals.post_code = "1234567"
      @order_arrivals.valid?
      expect(@order_arrivals.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end
    it 'prefectureが未選択だと購入できない' do
      @order_arrivals.prefecture_id = '1'
      @order_arrivals.valid?
      expect(@order_arrivals.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空だと購入できない' do
      @order_arrivals.city = ''
      @order_arrivals.valid?
      expect(@order_arrivals.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空だと購入できない' do
      @order_arrivals.address = ''
      @order_arrivals.valid?
      expect(@order_arrivals.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberが空だと購入できない' do
      @order_arrivals.phone = ''
      @order_arrivals.valid?
      expect(@order_arrivals.errors.full_messages).to include("Phone can't be blank")
    end
    it 'phone_numberが10桁では購入できない' do
      @order_arrivals.phone = '090123456'
      @order_arrivals.valid?
      expect(@order_arrivals.errors.full_messages).to include( "Phone Out of setting range")
    end

    context '内容に問題ない場合' do
      it "priceとtokenがあれば保存ができること" do
        @order_arrivals.valid?
        expect(@order_arrivals).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "tokenが空では登録できないこと" do
        @order_arrivals.token = nil
        @order_arrivals.valid?
        expect(@order_arrivals.errors.full_messages).to include("Token can't be blank")
      end
    end

  end
 end
end