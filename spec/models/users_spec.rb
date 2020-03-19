require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    # 通常はFactoryBot.build()としなければならないが、ヘルパーに書いた記述のおかげで省略
    @user = build(:user)
  end

  describe 'バリデーション' do
    it 'nameとemailどちらも値が設定されていれば、OK' do
      expect(@user.valid?).to eq(true)
    end

    it 'nameが空だとNG' do
      @user.name = ''
      expect(@user.valid?).to eq(false)
    end

    it 'emailが空だとNG' do
      @user.email = ''
      expect(@user.valid?).to eq(false)
    end
  end
end

# 実行するコマンドは bundle exec rspec spec/models/users_spec.rb