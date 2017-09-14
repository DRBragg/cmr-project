require "rails_helper"

RSpec.describe Api::V1::CommentsController, type: :controller do
  let!(:user1) {FactoryGirl.create(:user)}
  let!(:representative1) {FactoryGirl.create(:representative, user: user1)}
  let!(:review1) {FactoryGirl.create(:review, representative: representative1, user: user1)}

  describe "POST#create" do
    it "creates a new Comment" do

      expect{ post :create, params: { representative_id: representative1.id, review_id: review1.id, comment: { body: "You better watch out, you better not cry", review_id: review1.id, user_id: user1.id } }, as: :json }.to change{ Comment.count }.by 1

      json_response = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(json_response).to be_kind_of(Hash)
      expect(json_response).to_not be_kind_of(Array)
      expect(json_response["body"]).to eq "You better watch out, you better not cry"
    end
  end
end
