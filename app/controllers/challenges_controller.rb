class ChallengesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_challenge, only: [:show, :update, :destroy, :not_interested]
  before_action :challenge_owner?, only: [:update, :not_interested, :destroy]
  # GET /challenges/1
  def show
  end

  # PATCH/PUT, updates a challenge to chosen or unchosen depending on its status.
  def update
    status = params[:status]
    @challenge.status = status if status
    @challenge.save! # TODO: on error
    respond_to do |format|
      format.html { redirect_to root_path, notice: Challenge.notice(status)}
    end

    rescue
      respond_to do |format|
        format.html { redirect_to root_path, notice: "Something went terribly wrong."}
      end
  end

  # PATCH/PUT, updates a challenge to posted if a post has been created for it.
  def not_interested
    @challenge.not_interested!
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Ok, you won't see it again!!"}
    end
  end

  private

    #Sets the challenge if the challenge exists, otherwise redirects home.
    def set_challenge
      if Challenge.exists?(params[:id])
        @challenge = Challenge.find(params[:id])
      else
        redirect_to root_path
      end
    end

    #whitelisted parameters
    def challenge_params
      params.require(:challenge).permit(:activity_id, :user_id, :status)
    end

    #determines if the challenge is owned by the current_user
    def challenge_owner?
      if current_user == @challenge.user
        true
      else
        flash[:notice] = "That's not your challenge!"
        redirect_to challenge_path(@challenge)
      end
    end

end
