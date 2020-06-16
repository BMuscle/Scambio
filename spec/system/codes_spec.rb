require 'rails_helper'
require 'support/user_shared_context'

RSpec.describe Codes, type: :system do
    let(:general_user){FactoryBot.create(:general_user)}

    describe 'コード一覧' do 
        let(:login_user){general_user}
        include_context 'ユーザがログイン状態になる'

        context 'マイページに遷移している' do
            before do 
                click_link 'マイページ'
            end

            it 'コード一覧へのリンクが表示されている' do
                expect(page).to have_content 'コード一覧'
            end

            context 'コード一覧へ遷移している' do
                let!(:nintendo_friend_code){FactoryBot.create(:nintendo_friend_code, user_id: login_user.id)}
                let!(:play_station_network_id){FactoryBot.create(:play_station_network_id, user_id: login_user.id)}
                before do
                    click_link 'コード一覧'
                end

                it '任天堂フレンドコードが表示されている' do
                    split_codes = nintendo_friend_code.friend_code.scan(/.{1,#{4}}/)
                    expect(page).to have_content "#{split_codes[0]}-#{split_codes[1]}-#{split_codes[2]}"
                end

                it 'PSN_IDが表示されている' do
                    expect(page).to have_content play_station_network_id.psn_id
                end
            end
        end
    end
end