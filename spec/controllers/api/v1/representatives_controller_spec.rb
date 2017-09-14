# require 'rails_helper'
#
#
# RSpec.describe Api::V1::RepresentativesController, type: :controller do
#
  # describe "GET #show" do
  #   before do
  #     get :show, id: representative.id
  #   end
  #
  #   let(:representative) { Representative.create(name: 'Hello World') }
  #
  #   it "returns http success" do
  #     expect(response).to have_http_status(:success)
  #   end
  #
  #   it "response with JSON body containing expected Representative attributes" do
  #     hash_body = nil
  #     expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
  #     expect(hash_body).to match({
  #       id: representative.id,
  #       first_name:
  #       title: 'Hello World'
  #     })
  #   end
  # end
# end
#
# describe "RepresentativesController API" do
#   it 'displays current representatives' do
#     FactoryGirl.create_representatives(:representative, 5)
#
#     get '/api/v1/representatives'
#
#     #test for the 200 status-code
#     expect(response).to be_success
#
#     #check to make sure the right amount of messages are returned
#     expect(json['representatives'].length).to eq(5)
#   end
#
#   it 'displays one representative' do
#     representative = FactoryGirl.create(:representative)
#     get "/api/v1/representatives/#{representative.id}"
#
#     #test for the 200 status-code
#     expect(response).to be_success
#
#     #check that the representative attributes are the same
#     expect(json['content']).to eq(representative.content)
#   end
# end



require "rails_helper"

RSpec.describe Api::V1::RepresentativesController, type: :controller do
  let!(:representative1) { Representative.create(first_name: "Pug", last_name: "Swimming") }
  let!(:representative2) { Representative.create(first_name: "Hello", last_name: "Dog") }

  describe "GET#index" do
    it "should return a list of all the representatives" do

      get :index
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json.length).to eq 2
      expect(returned_json[0]["first_name"]).to eq "Pug"
      expect(returned_json[0]["last_name"]).to eq "Swimming"

      expect(returned_json[1]["first_name"]).to eq "Hello"
      expect(returned_json[1]["last_name"]).to eq "Dog"
    end
  end

  describe "GET#show" do
    it "should return a list of all the representatives" do


      get :show
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json.length).to eq 2
      expect(returned_json[0]["first_name"]).to eq "Pug"
      expect(returned_json[0]["last_name"]).to eq "Swimming"

      expect(returned_json[1]["first_name"]).to eq "Hello"
      expect(returned_json[1]["last_name"]).to eq "Dog"

    end
    describe "GET #show" do
      before do
        get :show, id: representative.id
      end

      let(:representative) { Representative.create(name: 'Hello World') }


  end

  describe "POST#create" do
    it "creates a new Representative" do
      post_json = { first_name: "Beth", email: "beth@beth.com" }.to_json

      expect{ post(:create)}.to change{ Representative.count }.by 1
    end
  end

  it "returns the json of the newly posted representative" do
    post_json = { first_name: "Beth", email: "beth@beth.com" }.to_json

    post(:create)
    returned_json = JSON.parse(response.body)
    expect(response.status).to eq 200
    expect(response.content_type).to eq("application/json")

    expect(returned_json).to be_kind_of(Hash)
    expect(returned_json).to_not be_kind_of(Array)
    expect(returned_json["first_name"]).to eq "Beth"
    expect(returned_json["email"]).to eq "beth@beth.com"
  end
end
