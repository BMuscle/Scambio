FactoryBot.define do
  factory :item_trade_queue do
    user_id {1}
    item_trade_id {1}
    establish {false}
  end
end
