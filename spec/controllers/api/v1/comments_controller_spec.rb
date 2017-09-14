# describe "CommentsController API" do
#   it 'displays current comments' do
#     FactoryGirl.create_comments(:comment, 2)
#
#     get '/api/v1/comments'
#
#     #test for the 200 status-code
#     expect(response).to be_success
#
#     #check to make sure the right amount of messages are returned
#     expect(json['comments'].length).to eq(2)
#     expect(json['content']).to eq(comment.content)
#   end

  # it 'displays one representative' do
  #   representative = FactoryGirl.create(:representative)
  #   get "/api/v1/comments/#{comment.id}"
  #
  #   #test for the 200 status-code
  #   expect(response).to be_success
  #
  #   #check that the representative attributes are the same
  #   expect(json['content']).to eq(representative.content)
  # end
# end



require "rails_helper"

RSpec.describe Api::V1::CommentsController, type: :controller do
  # let!(:first_comment) = { Comment.create(body: "This is really the very best dog") }
  # let!(:second_comment) = { Comment.create(body: "This dog may be even cuter than the other one") }

  describe "POST#create" do
    it "creates a new Comment" do
      post_json = { body: "You better watch out, you better not cry" }.to_json

      expect{ post (:create)}.to change{ Comment.count }.by 1
    end
  end

  it "returns the json of the newly posted review" do
    post_json = { body: "You better watch out, you better not cry" }.to_json

    post(:create)
    returned_json = JSON.parse(response.body)
    expect(response.status).to eq 200
    expect(response.content_type).to eq("application/json")

    expect(returned_json).to be_kind_of(Hash)
    expect(returned_json).to_not be_kind_of(Array)
    expect(returned_json["body"]).to eq "You better watch out, you better not cry"
  end
end
