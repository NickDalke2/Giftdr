require "rails_helper" 

RSpec.describe PersonsController do

  render_views

  describe "GET index" do
    it "collects persons into @persons" do 
      person = Person.create(name: "Johnny Karate")
      get :index
      expect(assigns(:persons)).to eq([person]) 
    end 
  end 

end 