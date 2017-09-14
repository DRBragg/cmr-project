# describe "ReviewsController API" do
#   it 'displays current reviews' do
#     FactoryGirl.create_review(:review, 2)
#
#     get '/api/v1/reviews'
#
#     #test for the 200 status-code
#     expect(response).to be_success
#
#     #check to make sure the right amount of messages are returned
#     expect(json['reviews'].length).to eq(2)
#     expect(json['content']).to eq(representative.content)
#   end

  # it 'displays one representative' do
  #   representative = FactoryGirl.create(:representative)
  #   get "/api/v1/representatives/#{representative.id}"
  #
  #   #test for the 200 status-code
  #   expect(response).to be_success
  #
  #   #check that the representative attributes are the same
  #   expect(json['content']).to eq(representative.content)
  # end
# end


require "rails_helper"

RSpec.describe Api::V1::ReviewsController, type: :controller do
  # let!(:first_review) = { Review.create(headline: "Hello this is Dog", body: "This is really the very best dog") }
  # let!(:second_review) = { Review.create(headline: "Pug Swimming", body: "This dog may be even cuter than the other one") }

  describe "POST#create" do
    it "creates a new Review" do
      post_json = { headline: "Beth is coming to town", body: "You better watch out, you better not cry" }.to_json

      expect{ post(:create)}.to change{ Review.count }.by 1
    end
  end

  it "returns the json of the newly posted review" do
    post_json = { headline: "Beth is coming to town", body: "You better watch out, you better not cry" }.to_json

    post(:create)
    returned_json = JSON.parse(response.body)
    expect(response.status).to eq 200
    expect(response.content_type).to eq("application/json")

    expect(returned_json).to be_kind_of(Hash)
    expect(returned_json).to_not be_kind_of(Array)
    expect(returned_json["headline"]).to eq "Beth is coming to town"
    expect(returned_json["body"]).to eq "You better watch out, you better not cry"
  end
end
