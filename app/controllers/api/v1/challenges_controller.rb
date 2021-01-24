module Api
    module V1
        class ChallengesController < ApplicationController
            def index
                challenges = Challenge.all
                render json: ChallengeSerializer.new(challenges, options).serialized_json
            end
            def show
                challenge = Challenge.find_by(slug: params[:slug])
                render json: ChallengeSerializer.new(challenge, options).serialized_json
            end
            def create
                challenge = Challenge.new(challenge_params)
                if challenge.save
                    render json: ChallengeSerializer.new(challenge).serialized_json
                else
                    render json: {error: challenge.errors.messages}, status: 422
                end
            end

            def update
                challenge = Challenge.find_by(slug: params[:slug])
                
                if challenge.update(challenge_params)
                    render json: ChallengeSerializer.new(challenge, options).serialized_json
                else
                    render json: {error: challenge.errors.messages}, status: 422
                end
            end

            def destroy
                challenge = Challenge.find_by(slug: params[:slug])
                
                if challenge.destroy
                    head :no_content
                else
                    render json: {error: challenge.errors.messages}, status: 422
                end
            end

            private
            def challenge_params
                params.require(:challenge).permit(:name, :language, :description, :time, :points )
            end

            def options
                @options ||= { include: %i[challenges]}
            end
        end
    end
end