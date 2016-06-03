require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  
  describe "GET #new" do
    before do
      get :new
    end

    it "returns http success" do
      expect(response.status).to eq(200)
      #or this:
      #expect(response).to have_http_status(:success)
    end

    it "renders the new template" do
      expect(response).to render_template("new")
    end

    it "assigns instance user" do
      expect(assigns[:user]).to be_a User
    end
  end

  describe "GET #show" do
    it "has a 200 status code" do
      get :show, id: 1
      expect(response.status).to eq(200)
    end
  end


end
