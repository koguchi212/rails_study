require 'rails_helper'

describe 'Aims', type: :system do
  describe 'GET /aims' do
    let(:user_a) { FactoryBot.create(:user, name: 'ユーザA', email: 'a@example.com') }
    let(:user_b) { FactoryBot.create(:user, name: 'ユーザB', email: 'b@example.com') }

    before do
      FactoryBot.create(:aim, title: '目標A', user: user_a)
      visit login_path
      fill_in 'メールアドレス', with: login_user.email
      fill_in 'パスワード', with: login_user.password
      click_button 'ログインする'
    end

    context 'ユーザＡがログインしている場合' do
      let(:login_user) { user_a }
      it 'ユーザＡが作成したタスクが表示される' do
        expect(page).to have_content '目標A'
      end
    end

    context 'ユーザＢがログインしている場合' do
      let(:login_user) { user_b }
      
      it 'ユーザＡが作成したタスクが表示されない' do
        expect(page).to have_no_content '目標A'
      end
    end
  end
end