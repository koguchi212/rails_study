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

  describe '新規作成機能' do
    let(:login_user) { user_a }
    before do
      visit new_aim_path
      fill_in '目標名', with: aim_title
      click_button '新規作成'
    end

    context '新規作成画面でタイトルを入力したとき' do
      let(:aim_title) { '新規作成のテストを書く' }
      it '正常に登録される' do
        expect(page).to have_content '新規作成のテストを書く'
      end
    end

    context '新規作成画面でタイトルを入力しなかったとき' do
      let(:aim_title) { '' }
      it 'エラーとなる' do
        expect(page).to have_selector('form[action="/aims"]')
        expect(page).to have_selector('li', text: "Title can't be blank")                
      end
    end
  end
end
