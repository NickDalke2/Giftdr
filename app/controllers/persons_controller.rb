class PersonsController < ApplicationController
  before_action :find_person, only:[:show, :create,:update]
  def index
    @persons = Person.all
    @reminders = Reminder.all
  end

  def show
    @interest = Interest.new
    @keyword = params[:search]
		@type = params[:type]
    @page = params[:page]
		@category = [
			'All', 'DVD', 'Electronics', 'Toys', 'VideoGames', 'PCHardware', 'Tools', 'SportingGoods', 'Books', 'Software', 'Kitchen', 'Apparel','Music','Video'
		]

    request = Vacuum.new('US')
    request.configure(
      aws_access_key_id: ENV['aws_access_key_id'],
      aws_secret_access_key: ENV['aws_secret_access_key'],
      associate_tag: ENV['associate_tag']
      )

    params = {
        'SearchIndex' => @type,
        'Keywords'=> @keyword,
        'ItemPage' => @page,
        'ResponseGroup' => "ItemAttributes,Images,Offers"
      }

      ## DEFINES THE REQUEST RETURN
      raw_products = request.item_search(query: params)
      hashed_products = raw_products.to_h
      ## PUTS SPECIFICS OF HASHED SEARCH RESPONSE INTO AN ARRAY
      @products = hashed_products['ItemSearchResponse']['Items']['Item']
  end

  def update
    @interest = Interest.find_or_create_by(interest_params)
    @person.interests << @interest
    if @interest.save
      redirect_to person_path(@person.id, search:@interest.name,type:'All')
    end
  end

  def new
  end

  def edit
  end

private
  def interest_params
    params.require(:interest).permit(:name)
  end
  def find_person
    @person = Person.find(params[:id])
  end
end
