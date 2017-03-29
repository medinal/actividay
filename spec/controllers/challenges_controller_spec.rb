require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe ChallengesController, type: :controller do

  describe "anonymous user" do
    before :each do
      login_with nil
    end

    it "should be redirected to signing" do
      get :index
      expect( response ).to redirect_to( new_user_session_path )
    end
  end

  describe "GET #index" do
    it "assigns all challenges as @challenges" do
      challenge = Challenge.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:challenges)).to eq([challenge])
    end
  end

  describe "GET #show" do
    it "assigns the requested challenge as @challenge" do
      challenge = Challenge.create! valid_attributes
      get :show, params: {id: challenge.to_param}, session: valid_session
      expect(assigns(:challenge)).to eq(challenge)
    end
  end

  describe "GET #new" do
    it "assigns a new challenge as @challenge" do
      get :new, params: {}, session: valid_session
      expect(assigns(:challenge)).to be_a_new(Challenge)
    end
  end

  describe "GET #edit" do
    it "assigns the requested challenge as @challenge" do
      challenge = Challenge.create! valid_attributes
      get :edit, params: {id: challenge.to_param}, session: valid_session
      expect(assigns(:challenge)).to eq(challenge)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Challenge" do
        expect {
          post :create, params: {challenge: valid_attributes}, session: valid_session
        }.to change(Challenge, :count).by(1)
      end

      it "assigns a newly created challenge as @challenge" do
        post :create, params: {challenge: valid_attributes}, session: valid_session
        expect(assigns(:challenge)).to be_a(Challenge)
        expect(assigns(:challenge)).to be_persisted
      end

      it "redirects to the created challenge" do
        post :create, params: {challenge: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Challenge.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved challenge as @challenge" do
        post :create, params: {challenge: invalid_attributes}, session: valid_session
        expect(assigns(:challenge)).to be_a_new(Challenge)
      end

      it "re-renders the 'new' template" do
        post :create, params: {challenge: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested challenge" do
        challenge = Challenge.create! valid_attributes
        put :update, params: {id: challenge.to_param, challenge: new_attributes}, session: valid_session
        challenge.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested challenge as @challenge" do
        challenge = Challenge.create! valid_attributes
        put :update, params: {id: challenge.to_param, challenge: valid_attributes}, session: valid_session
        expect(assigns(:challenge)).to eq(challenge)
      end

      it "redirects to the challenge" do
        challenge = Challenge.create! valid_attributes
        put :update, params: {id: challenge.to_param, challenge: valid_attributes}, session: valid_session
        expect(response).to redirect_to(challenge)
      end
    end

    context "with invalid params" do
      it "assigns the challenge as @challenge" do
        challenge = Challenge.create! valid_attributes
        put :update, params: {id: challenge.to_param, challenge: invalid_attributes}, session: valid_session
        expect(assigns(:challenge)).to eq(challenge)
      end

      it "re-renders the 'edit' template" do
        challenge = Challenge.create! valid_attributes
        put :update, params: {id: challenge.to_param, challenge: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested challenge" do
      challenge = Challenge.create! valid_attributes
      expect {
        delete :destroy, params: {id: challenge.to_param}, session: valid_session
      }.to change(Challenge, :count).by(-1)
    end

    it "redirects to the challenges list" do
      challenge = Challenge.create! valid_attributes
      delete :destroy, params: {id: challenge.to_param}, session: valid_session
      expect(response).to redirect_to(challenges_url)
    end
  end

end
