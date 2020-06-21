class UserMessagePost < ApplicationRecord
    belongs_to :user

    validates :message, presence: true
    validates :user_id, presence: true
    validates :already_read_flag, inclusion: {in: [true, false]}

    scope :already_read, ->{
        update!(already_read_flag: true)
    }

    def self.create_message_sell!(item_trade_queue)
        self.create!(user_id: item_trade_queue.user_id, message: message_template('sell_item_trade', item_trade_queue: item_trade_queue))
    end

    def self.create_message_reject!(item_trade_queue)
        self.create!(user_id: item_trade_queue.user_id, message: message_template('reject_item_trade', item_trade_queue: item_trade_queue))
    end

    def self.create_message_approve!(item_trade_queue)
        self.create!(user_id: item_trade_queue.user_id, message: message_template('approve_item_trade', item_trade_queue: item_trade_queue))
    end

    private

    def self.message_template(partial_name, locals)
        ApplicationController.renderer.render partial: "users/user_message_posts/shared/#{partial_name}", locals: locals 
    end
end
