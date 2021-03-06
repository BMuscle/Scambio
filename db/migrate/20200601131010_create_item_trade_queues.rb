class CreateItemTradeQueues < ActiveRecord::Migration[6.0]
  def change
    create_table :item_trade_queues do |t|
      t.boolean :approve, null: true 

      t.references :item_trade, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: true

      t.integer :lock_version, default: 0
      t.timestamps
    end
  end
end
