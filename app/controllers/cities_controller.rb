class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy]
  before_filter :load_state, only: [:index, :create, :new]
  
  # GET
  def index
    @cities = @state.cities

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cities }
    end
  end

  # GET
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @city }
    end
  end

  # GET
  def new
    @city = @state.cities.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @city }
    end
  end

  # GET
  def edit
  end

  # POST
  def create
    @city = @state.cities.new(city_params)

    respond_to do |format|
      if @city.save
        format.html { redirect_to @city, notice: 'City was successfully created.' }
        format.json { render json: @city, status: :created, location: @city }
      else
        format.html { render action: "new" }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT
  def update
    respond_to do |format|
      if @city.update_attributes(city_params)
        format.html { redirect_to @city, notice: 'City was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE
  def destroy
    @city.destroy

    respond_to do |format|
      format.html { redirect_to state_cities_path(@city.state_id) }
      format.json { head :no_content }
    end
  end

  
  private
  def set_city
    @city = City.find(params[:id])
  end

  def city_params
    params.require(:city).permit(:name, :state_id)
  end

  def load_state
    @state = State.find_by_id(params[:state_id])
  end
end
