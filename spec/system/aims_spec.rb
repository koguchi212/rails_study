require 'rails_helper'

describe 'Aims', type: :system do
  describe 'GET /aims' do
    before do
      user_a = FactoryBot.create(:user, name: 'ユーザA', email: 'a@example.com')
      FactoryBot.create(:aim, title: '目標A', user: user_a)
    end

    context 'ユーザＡがログインしている場合' do
      before do
        visit login_path
        fill_in 'メールアドレス', with: 'a@example.com'
        fill_in 'パスワード', with: 'password'
        click_button 'ログインする'
      end

      it 'ユーザＡが作成したタスクが表示される' do
        expect(page).to have_content '目標A'
      end
    end
  end
end