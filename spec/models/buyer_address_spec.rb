require 'rails_helper'

RSpec.describe Address, type: :model do

  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @buyer_address = FactoryBot.build(:buyer_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入' do

    context '商品購入が上手くいく時' do

      it'全て正しく記入した時(buildingに関しては記入しなくても良い)'do
        expect(@buyer_address).to be_valid
      end
      
      it'buildingが空でも登録できる'do
      @buyer_address.building = ""
      expect(@buyer_address).to be_valid
      end

    end


      context '商品購入が上手くいかない時' do

        it 'yubin_numberが空では登録できない' do
          @buyer_address.yubin_number = ""
          @buyer_address.valid?
          expect(@buyer_address.errors.full_messages).to include("Yubin number can't be blank")  
        end
        it 'yubin_numberは3桁-4桁でないと登録できない' do
          @buyer_address.yubin_number = "0000000"
          @buyer_address.valid?
          expect(@buyer_address.errors.full_messages).to include("Yubin number ハイフン(-)を含んでください")  
        end
        it 'municipalityが空では登録できない' do
          @buyer_address.municipality = ""
          @buyer_address.valid?
          expect(@buyer_address.errors.full_messages).to include("Municipality can't be blank")  
        end
        it 'addressが空では登録できない' do
          @buyer_address.address = ""
          @buyer_address.valid?
          expect(@buyer_address.errors.full_messages).to include("Address can't be blank")  
        end
        it 'phone_numberが空では登録できない' do
          @buyer_address.phone_number = ""
          @buyer_address.valid?
          expect(@buyer_address.errors.full_messages).to include("Phone number can't be blank")  
        end
        it 'phone_numberは全角だと登録できない' do
          @buyer_address.phone_number = "１１１１１１１１１１"
          @buyer_address.valid?
          expect(@buyer_address.errors.full_messages).to include("Phone number 10または11桁の半角英数字で入力してください")  
        end
        it 'phone_numberは10文字未満では登録できない' do
          @buyer_address.phone_number = "000000000"
          @buyer_address.valid?
          expect(@buyer_address.errors.full_messages).to include("Phone number 10または11桁の半角英数字で入力してください")  
        end
        it 'phone_numberは12文字以上では登録できない' do
          @buyer_address.phone_number = "000000000000000"
          @buyer_address.valid?
          expect(@buyer_address.errors.full_messages).to include("Phone number 10または11桁の半角英数字で入力してください")  
        end
        it 'prefecture_idが空では登録できない' do
          @buyer_address.prefecture_id = nil
          @buyer_address.valid?
          expect(@buyer_address.errors.full_messages).to include("Prefecture を入力してください")  
        end

        it 'トークンが空では登録できない' do
          @buyer_address.token = nil
          @buyer_address.valid?
          expect(@buyer_address.errors.full_messages).to include("Token can't be blank")
        end

        it 'item_idが空では登録できない' do
          @buyer_address.item_id = nil
          @buyer_address.valid?
          expect(@buyer_address.errors.full_messages).to include("Item can't be blank")
        end

        it 'user_idが空では登録できない' do
          @buyer_address.user_id = nil
          @buyer_address.valid?
          expect(@buyer_address.errors.full_messages).to include("User can't be blank")
        end



      end


  end


end
