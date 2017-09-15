# require "rails_helper"
#
# RSpec.describe Api::V1::ReviewsController, type: :controller do
#   describe "POST#create" do
#     let!(:user2) {FactoryGirl.create(:user)}
#     let!(:representative2) {FactoryGirl.create(:representative, user: user2)}
#     it "creates a new Review" do
#       expect{ post :create, params: {representative_id: representative2.id, review: { headline: "You better watch out, you better not cry", body: "this is my reviews", rating: 3, representative_id: representative2.id, user_id: user2.id } }, as: :json }.to change{ Review.count }.by 1
#
#       json_response = JSON.parse(response.body)
#       expect(response.status).to eq 200
#       expect(response.content_type).to eq("application/json")
#
#       expect(json_response).to be_kind_of(Hash)
#       expect(json_response).to_not be_kind_of(Array)
#       expect(json_response["headline"]).to eq "You better watch out, you better not cry"
#     end
#   end
# end
