class Codes::NintendoFriendCodesController < CodesController

    def new 
        @nintendo_friend_code = current_user.nintendo_friend_code.new
    end

    def create 
        @nintendo_friend_code = current_user.nintendo_friend_code.new(nintendo_friend_code_params)

        if @nintendo_friend_code.save 
            redirect_to codes_path, notice: t('flash.regist')
        else
            render :new
        end
    end

    def edit 
        @nintendo_friend_code = current_user.nintendo_friend_code
    end

    def update 
        @nintendo_friend_code = current_user.nintendo_friend_code

        if @nintendo_friend_code.update(nintendo_friend_code_params)
            redirect_to codes_path, notice: t('flash.update')
        else
            render :edit 
        end
    end

    def destroy 
        @nintendo_friend_code = current_user.nintendo_friend_code

        @nintendo_friend_code.destroy!

        redirect_to codes_path, notice: t('flash.destroy')
    end

    private

    def nintendo_friend_code_params
        params.require(:nintendo_friend_code).permit(:id, :friend_code)
    end
end
