require 'rails_helper'

describe 'Aims', type: :system do
  let(:user_a) { FactoryBot.create(:user, name: 'ユーザA', email: 'a@example.com') }
  let(:user_b) { FactoryBot.create(:user, name: 'ユーザB', email: 'b@example.com') }
  let!(:aim_a) { FactoryBot.create(:aim, title: '目標A', user: user_a) }

  before do
    visit login_path
    fill_in 'メールアドレス', with: login_user.email
    fill_in 'パスワード', with: login_user.password
    click_button 'ログインする'
  end
  describe '一覧表示機能' do
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

  describe '詳細表示機能' do
    context 'ユーザＡがログインしている場合' do
      let(:login_user) { user_a }
      before do
        visit aim_path(aim_a)
      end

      it 'ユーザＡが作成したタスクが表示される' do
        expect(page).to have_field('aim[title]', with: '目標A')
      end
    end
  end
end