class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show, :update, :destroy, :build_post]
  before_action :challenge_owner?, only: [:update, :destroy]
  # GET /challenges/1
  def show
  end

  # PATCH/PUT /challenges/1
  def update
    if @challenge.unchosen?
      @challenge.status = :chosen
      @challenge.save
      respond_to do |format|
        format.html { redirect_to root_path, notice: "You've accepted a challenge! Go get 'em!'"}
      end
    elsif @challenge.chosen?
      @challenge.status= :unchosen
      @challenge.save
      respond_to do |format|
        format.html { redirect_to root_path, notice: "Maybe next time!"}
      end
    end
  end

  def build_post
    if !@challenge.post
      @challenge.build_post.save
    end
    redirect_to edit_post_path(@challenge.post)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge
      @challenge = Challenge.find(params[:id])
    end

    def challenge_params
      params.require(:challenge).permit(:activity_id, :user_id, :status)
    end

    def challenge_owner?
      if current_user = @challenge.user
        true
      else
        flash[:notice] = "That's not your challenge!"
        redirect_to challenge_path(@challenge)
      end
    end

end
