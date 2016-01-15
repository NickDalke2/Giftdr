require "rails_helper" 


RSpec.describe UsersController do 

  render_views

  describe "GET index" do
    it "collects users into @users" do 
      user = User.create(name: "Johnny Karate", uid:"a", provider: "facebook")
      get :index
      expect(assigns(:users)).to eq([user]) 
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template :index 
    end
  end

  describe "GET show" do
  	it "renders the show template" do
  		user = User.create(name: "Johnny Karate", uid: 1, provider: "facebook") 
      session[:user_id] = user.id 
  		get :show, id: user.id 
  		expect(response).to render_template :show 
  	end 
  end 

  describe "GET show" do
    it "renders the show template" do
      user = User.create(name: "Johnny Karate", uid: 1, provider: "facebook") 
      get :show, id: user.id 
      # expect(response.body).to contain("Never forget another important event") 
      expect(response.body).to match /redirected/im
    end 
  end 

  describe "GET edit" do
    it "renders the show template" do
      user = User.create(name: "Johnny Karate", uid: 1, provider: "facebook") 
      get :edit, id: user.id 
      # expect(response.body).to contain("Never forget another important event") 
      expect(response.body).to match /redirected/im 
    end 
  end 

  describe "GET edit" do
    it "renders the show template" do
      user = User.create(name: "Johnny Karate", uid: 1, provider: "facebook") 
      session[:user_id] = user.id 
      get :edit, id: user.id 
      expect(response).to render_template :edit 
    end 
  end 

  describe 'PATCH update' do 
    it "with valid attributes, redirects to the contact" do
      user = User.create(name: "johnny karate", uid: 1, provider: "facebook")  
      # session[:user_id] = user.id
      post :update, id: user.id 
      expect(response.body).to match /redirected/im 
  		# it "updates the contact in the database"
    end 
  end

	describe 'PATCH update' do 
    it "with invalid attributes, re-renders the :edit template" do 
      user = User.create(name: "Andy Dwyer", uid: 1, provider: "facebook")
      session[:user_id] = user.id 
      get :edit, id: user.id  
      expect(response.body).to render_template :edit 
    end 
	end


end  