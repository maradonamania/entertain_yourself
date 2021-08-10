require 'rails_helper'

RSpec.describe Plan, type: :model do
  describe '計画の保存' do
    before do
      @plan = FactoryBot.build(:plan)
    end

    context '内容に問題がない場合' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@plan).to be_valid
      end
      it '画像がなくても保存できること' do
        @plan.image = nil
        expect(@plan).to be_valid
      end
    end
    context '内容に問題がある場合保存できないこと' do
      it 'nameが空だと保存できないこと' do
        @plan.name = ''
        @plan.valid?
        expect(@plan.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空だと保存できない' do
        @plan.description = ""
        @plan.valid?
        expect(@plan.errors.full_messages).to include("Description can't be blank")
      end
      it 'genre_idが選択されないと保存されない' do
        @plan.genre_id = nil
        @plan.valid?
        expect(@plan.errors.full_messages).to include("Genre can't be blank")
      end
      it 'genre_idが0を選択していると保存できない' do
        @plan.genre_id = 0
        @plan.valid?
        expect(@plan.errors.full_messages).to include("Genre can't be blank")
      end
      it 'budgetが選択されないと保存されない' do
        @plan.budget = nil
        @plan.valid?
        expect(@plan.errors.full_messages).to include("Budget can't be blank")
      end
      it 'budgetが0を選択していると保存できない' do
        @plan.budget_id = 0
        @plan.valid?
        expect(@plan.errors.full_messages).to include("Budget can't be blank")
      end
      it 'locationが選択されないと保存されない' do
        @plan.location = nil
        @plan.valid?
        expect(@plan.errors.full_messages).to include("Location can't be blank")
      end
      it 'locationが0を選択していると保存できない' do
        @plan.location_id = 0
        @plan.valid?
        expect(@plan.errors.full_messages).to include("Location can't be blank")
      end
      it 'expected_time_idを選択しないと保存されない' do
        @plan.expected_time_id = nil
        @plan.valid?
        expect(@plan.errors.full_messages).to include("Expected time can't be blank")
      end
      it 'expected_time_idが0を選択していると保存できない' do
        @plan.expected_time_id = 0
        binding.pry
        @plan.valid?
        expect(@plan.errors.full_messages).to include("Expected time can't be blank")
      end
    end
  end
end
