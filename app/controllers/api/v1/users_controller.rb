module Api
    module V1
        class UsersController < ApplicationController

            private
            def strong_params
                params.require(:student).permit(:name,)
            end

        end
    end
end