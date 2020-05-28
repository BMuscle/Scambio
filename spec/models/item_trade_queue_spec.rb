require 'rails_helper'

RSpec.describe ItemTradeQueue, type: :model do
  let!(:user){FactoryBot.create(:user)}
  let!(:item_genre){FactoryBot.create(:item_genre)}
  let!(:game){FactoryBot.create(:game)}
  let!(:buy_item){FactoryBot.create(:buy_item, item_genre_id: item_genre.id, game_id: game.id)}
  let!(:sale_item){FactoryBot.create(:sale_item, item_genre_id: item_genre.id, game_id: game.id)}
  let!(:item_trade){FactoryBot.create(:item_trade, user_id: user.id, game_id: game.id, buy_item_id: buy_item.id, sale_item_id: sale_item.id)}
  
  it "ユーザIDとアイテムトレードIDと終了フラグがある場合、有効である" do
    item_trade_queue = FactoryBot.build(:item_trade_queue, user_id: user.id, item_trade_id: item_trade.id, end_flag: true)
    expect(item_trade_queue).to be_valid
  end

  it "ユーザIDがない場合、無効である" do
    item_trade_queue = FactoryBot.build(:item_trade_queue, user_id: nil, item_trade_id: item_trade.id)
    item_trade_queue.valid?
    expect(item_trade_queue.errors[:user_id]).to include("を入力してください")
  end

  it "アイテムトレードIDがない場合、無効である" do
    item_trade_queue = FactoryBot.build(:item_trade_queue, user_id: user.id, item_trade_id: nil)
    item_trade_queue.valid?
    expect(item_trade_queue.errors[:item_trade_id]).to include("を入力してください")
  end

  it "終了フラグがない場合、無効である" do
    item_trade_queue = FactoryBot.build(:item_trade_queue, user_id: user.id, item_trade_id: item_trade.id, end_flag: nil)
    item_trade_queue.valid?
    expect(item_trade_queue.errors[:end_flag]).to include("は一覧にありません")
  end
end
