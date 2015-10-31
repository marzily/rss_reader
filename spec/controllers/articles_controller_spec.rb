require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  before(:each) do
    User.create(email:                 "margie@email.com",
                password:              "halloween",
                password_confirmation: "halloween")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(User.last)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #favorite" do
    it "returns http success" do
      get :favorite
      expect(response).to have_http_status(:success)
    end
  end

end
